{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.sourcehut;
  cfgIni = cfg.settings;
  scfg = cfg.builds;
  iniKey = "builds.sr.ht";

  rcfg = config.services.redis;
  drv = pkgs.sourcehut.buildsrht;
in {
  options.services.sourcehut.builds = {
    user = mkOption {
      type = types.str;
      default = "buildssrht";
      description = ''
        User for builds.sr.ht.
      '';
    };

    port = mkOption {
      type = types.int;
      default = 5002;
      description = ''
      '';
    };

    database = mkOption {
      type = types.str;
      default = "builds.sr.ht";
      description = ''
        PostgreSQL database name for builds.sr.ht.
      '';
    };

    statePath = mkOption {
      type = types.path;
      default = "${cfg.statePath}/buildssrht";
      description = ''
        State path for builds.sr.ht.
      '';
    };

    worker = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Enable workers on this machine.
      '';
    };
  };

  config = with scfg; lib.mkIf (cfg.enable && elem "builds" cfg.services) {
    users = {
      users.${user} = {
          group = user;
          description = "builds.sr.ht user";
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
            ExecStart = "${cfg.python}/bin/celery -A ${drv.pname}.${mod} worker -n buildsrht-${mod}@%%h --loglevel=info";
          };
        } // extra;
      in
      {
        buildsrht = import ./service.nix { inherit config pkgs lib; } scfg drv iniKey {
          # Hack to support discrepancy in naming (lists → listssrht, but builds !→ buildssrht, but builds → buildsrht).
          updateIniKey = "build.sr.ht";

          after = [ "redis.service" "postgresql.service" "network.target" ];
          requires = [ "postgresql.service" ];
          wantedBy = [ "multi-user.target" ];

          description = "builds.sr.ht website service";

          serviceConfig.ExecStart = "${cfg.python}/bin/gunicorn ${drv.pname}.app:app -b ${cfg.address}:${toString port}";
        };

        buildsrht-runner = mkIf scfg.worker (mkCeleryService "runner" { description = "builds.sr.ht runner service"; });
      };
    };

    services.sourcehut.settings = {
      # URL builds.sr.ht is being served at (protocol://domain)
      "builds.sr.ht".origin = mkDefault "http://builds.sr.ht.local";
      # Address and port to bind the debug server to
      "builds.sr.ht".debug-host = mkDefault "0.0.0.0";
      "builds.sr.ht".debug-port = mkDefault port;
      # Configures the SQLAlchemy connection string for the database.
      "builds.sr.ht".connection-string = mkDefault "postgresql:///${database}?user=${user}&host=/var/run/postgresql";
      "build.sr.ht".connection-string = mkDefault "postgresql:///${database}?user=${user}&host=/var/run/postgresql";
      # Set to "yes" to automatically run migrations on package upgrade.
      "builds.sr.ht".migrate-on-upgrade = mkDefault "yes";
      # The redis connection used for the Celery worker
      "builds.sr.ht".redis = mkDefault "redis://${rcfg.bind}:${toString rcfg.port}/0";

      # builds.sr.ht's OAuth client ID and secret for builds.sr.ht
      # Register your client at builds.example.com/oauth
      "builds.sr.ht".oauth-client-id = mkDefault null;
      "builds.sr.ht".oauth-client-secret = mkDefault null;

      # Script used to launch on ssh connection.
      # use master-shell on master
      # use runner-shell on runner
      # If master and runner are on the same machine, use runner-shell.
      "builds.sr.ht".shell = mkDefault (if scfg.worker then "${drv}/bin/runner-shell" else "${drv}/bin/master-shell");


      "builds.sr.ht::worker" = mkIf scfg.worker {
        name = mkDefault "runner.sr.ht.local";
        buildlogs = mkDefault "${statePath}/logs";
        images = mkDefault "${statePath}/images";
        controlcmd = mkDefault "${statePath}/images/control";
        timeout = mkDefault "45m";
        bind-address = mkDefault "0.0.0.0:8080";
        trigger-from = mkDefault null;
      };
     };
  };
}
