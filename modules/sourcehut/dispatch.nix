{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.sourcehut;
  cfgIni = cfg.settings;
  scfg = cfg.dispatch;
  iniKey = "dispatch.sr.ht";

  drv = pkgs.sourcehut.dispatchsrht;
in {
  options.services.sourcehut.dispatch = {
    user = mkOption {
      type = types.str;
      default = "dispatchsrht";
      description = ''
        User for dispatch.sr.ht.
      '';
    };

    port = mkOption {
      type = types.int;
      default = 5005;
      description = ''
      '';
    };

    database = mkOption {
      type = types.str;
      default = "dispatch.sr.ht";
      description = ''
        PostgreSQL database name for dispatch.sr.ht.
      '';
    };

    statePath = mkOption {
      type = types.path;
      default = "${cfg.statePath}/dispatchsrht";
      description = ''
        State path for dispatch.sr.ht.
      '';
    };
  };

  config = with scfg; lib.mkIf (cfg.enable && elem "dispatch" cfg.services) {
    users = {
      users.${user} = {
          group = user;
          description = "dispatch.sr.ht user";
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

      services.dispatchsrht = import ./service.nix { inherit config pkgs lib; } scfg drv iniKey {
        after = [ "postgresql.service" "network.target" ];
        requires = [ "postgresql.service" ];
        wantedBy = [ "multi-user.target" ];

        description = "dispatch.sr.ht website service";

        serviceConfig.ExecStart = "${cfg.python}/bin/gunicorn ${drv.pname}.app:app -b ${cfg.address}:${toString port}";
      };
    };

    services.sourcehut.settings = {
      # URL dispatch.sr.ht is being served at (protocol://domain)
      "dispatch.sr.ht".origin = mkDefault "http://dispatch.sr.ht.local";
      # Address and port to bind the debug server to
      "dispatch.sr.ht".debug-host = mkDefault "0.0.0.0";
      "dispatch.sr.ht".debug-port = mkDefault port;
      # Configures the SQLAlchemy connection string for the database.
      "dispatch.sr.ht".connection-string = mkDefault "postgresql:///${database}?user=${user}&host=/var/run/postgresql";
      # Set to "yes" to automatically run migrations on package upgrade.
      "dispatch.sr.ht".migrate-on-upgrade = mkDefault "yes";
      # dispatch.sr.ht's OAuth client ID and secret for meta.sr.ht
      # Register your client at meta.example.org/oauth
      "dispatch.sr.ht".oauth-client-id = mkDefault null;
      "dispatch.sr.ht".oauth-client-secret = mkDefault null;

      # dispatch.sr.ht requires builds.sr.ht parameters.
      "builds.sr.ht".oauth-client-id = mkDefault null;
      "builds.sr.ht".oauth-client-secret = mkDefault null;

      # dispatch.sr.ht's OAuth client ID and secret for GitHub integration
      "dispatch.sr.ht::github".oauth-client-id = mkDefault null;
      "dispatch.sr.ht::github".oauth-client-secret = mkDefault null;

      # dispatch.sr.ht's GitLab support
      "dispatch.sr.ht::gitlab".enabled = mkDefault false;
      "dispatch.sr.ht::gitlab".canonical-upstream = mkDefault "gitlab.com";
    };
  };
}
