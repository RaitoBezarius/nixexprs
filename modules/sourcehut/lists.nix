{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.sourcehut;
  cfgIni = cfg.settings;
  scfg = cfg.lists;
  iniKey = "lists.sr.ht";

  rcfg = config.services.redis;
  drv = pkgs.sourcehut.listssrht.overrideAttrs (old: {
    patches = (old.patches or []) ++ [ ./lmtp-ipv6-support.patch ];
  });
in {
  options.services.sourcehut.lists = {
    user = mkOption {
      type = types.str;
      default = "listssrht";
      description = ''
        User for lists.sr.ht.
      '';
    };

    port = mkOption {
      type = types.int;
      default = 5006;
      description = ''
      '';
    };

    database = mkOption {
      type = types.str;
      default = "lists.sr.ht";
      description = ''
        PostgreSQL database name for lists.sr.ht.
      '';
    };

    statePath = mkOption {
      type = types.path;
      default = "${cfg.statePath}/listssrht";
      description = ''
        State path for lists.sr.ht.
      '';
    };
  };

  config = with scfg; lib.mkIf (cfg.enable && elem "lists" cfg.services) {
    assertions =
      [
      ];

    users = {
      users.${user} = {
          group = user;
          description = "lists.sr.ht user";
      };

      groups.${user} = {};
    };

    services.postgresql = {
      authentication = ''
        local ${database} ${user} trust
      '';
      ensureDatabases = [ database ];
      ensureUsers = [
        { name = user;
          ensurePermissions = { "DATABASE \"${database}\"" = "ALL PRIVILEGES"; }; }
        ];
    };


    systemd = {
      tmpfiles.rules = [
        "d ${statePath} 0750 ${user} ${user} -"
      ];

      services =
      let
        mkCeleryService = mod: {...}@extra: {
          after = [ "postgresql.service" "network.target" ];
          requires = [ "postgresql.service" ];
          wantedBy = [ "multi-user.target" ];


          serviceConfig = {
            Type = "simple";
            User = user;
            Restart = "always";
            ExecStart = "${cfg.python}/bin/celery -A ${drv.pname}.${mod} worker -n listssrht-${mod}@%%h --loglevel=info";
          };
        } // extra;
      in
      {
        listssrht = import ./service.nix { inherit config pkgs lib; } scfg drv iniKey {
          after = [ "redis.service" "postgresql.service" "network.target" ];
          requires = [ "postgresql.service" ];
          wantedBy = [ "multi-user.target" ];

          description = "lists.sr.ht website service";

          serviceConfig.ExecStart = "${cfg.python}/bin/gunicorn ${drv.pname}.app:app -b ${cfg.address}:${toString port}";
        };

        listssrht-lmtp = {
          after = [ "network.target" ];
          wantedBy = [ "multi-user.target" ];

          restartTriggers = [ config.environment.etc."sr.ht/config.ini".source ];
          description = "lists.sr.ht incoming mail service";

          serviceConfig = {
            Type = "simple";
            User = user;
            Restart = "always";
            ExecStart = "${cfg.python}/bin/${drv.pname}-lmtp";
          };

          environment = {
            PYTHONUNBUFFERED = "1";
          };
        };

        listssrht-process = mkCeleryService "process" { description = "lists.sr.ht process service"; };
        listssrht-webhooks = mkCeleryService "webhooks" { description = "lists.sr.ht webhooks service"; };
      };
    };

    services.sourcehut.settings = {
      # URL lists.sr.ht is being served at (protocol://domain)
      "lists.sr.ht".origin = mkDefault "http://lists.sr.ht.local";
      # Address and port to bind the debug server to
      "lists.sr.ht".debug-host = mkDefault "0.0.0.0";
      "lists.sr.ht".debug-port = mkDefault port;
      # Configures the SQLAlchemy connection string for the database.
      "lists.sr.ht".connection-string = mkDefault "postgresql:///${database}?user=${user}&host=/var/run/postgresql";
      # Set to "yes" to automatically run migrations on package upgrade.
      "lists.sr.ht".migrate-on-upgrade = mkDefault "yes";
      # The redis connection used for the webhooks worker
      "lists.sr.ht".webhooks = mkDefault "redis://${rcfg.bind}:${toString rcfg.port}/1";
      # The redis connection used for the Celery worker
      "lists.sr.ht".redis = mkDefault "redis://${rcfg.bind}:${toString rcfg.port}/0";

      # lists.sr.ht's OAuth client ID and secret for lists.sr.ht
      # Register your client at lists.example.com/oauth
      "lists.sr.ht".oauth-client-id = mkDefault null;
      "lists.sr.ht".oauth-client-secret = mkDefault null;

      # Posting domain
      "lists.sr.ht".posting-domain = mkDefault "lists.sr.ht.local";

      # Trusted upstream SMTP server generating Authentication-Results header fields
      "lists.sr.ht".msgauth-server = mkDefault "mail.sr.ht.local";

      # If "no", prevent non-admins from creating new lists
      "lists.sr.ht".allow-new-lists = mkDefault false;

      # Protocol used by the worker
      "lists.sr.ht::worker".protocol = mkDefault "lmtp";
      # Socket (LMTP) or IP:URL (SMTP)
      "lists.sr.ht::worker".sock = mkDefault "/tmp/lists.sr.ht-lmtp.sock";
      # Group for R/W on the socket
      "lists.sr.ht::worker".sock-group = mkDefault "postfix";
      # Mimetype rejected by the daemon
      "lists.sr.ht::worker".reject-mimetypes = mkDefault "text/html";
      # URL returned in case of rejection
      "lists.sr.ht::worker".reject-url = mkDefault "https://man.sr.ht/lists.sr.ht/how-to-send.md";
     };
  };
}
