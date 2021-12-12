{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.services.django;
  enabledApps = filterAttrs (name: app: app.enable) cfg;
in {
  options.services.django = mkOption {
    type = types.attrsOf (types.submodule {
      options = {
        enable = mkEnableOption "this django application";

        package = mkOption {
          type = types.package;
        };

        settingsModule = mkOption {
          type = types.str;
        };

        wsgiEntryPoint = mkOption {
          type = types.str;
        };

        port = mkOption {
          type = types.port;
          default = 8000;
        };

        environment = mkOption {
          type = with types; attrsOf (nullOr (oneOf [ str path package ]));
          default = {};
        };

        environmentFile = mkOption {
          type = types.nullOr types.path;
          default = null;
        };

        unitMode = mkOption {
          type = types.enum [ "simple" "notify" ];
          description = ''
            The type of the unit that will wrap the service.
            Use `notify` when the server supports sd-notify.
            '';
          default = "simple";
        };
      };
    });
    default = {};
  };

  config.systemd.services = mapAttrs' (name: cfg: nameValuePair "django-${name}" {
    wantedBy = [ "multi-user.target" ];
    environment = cfg.environment // {
      DJANGO_SETTINGS_MODULE = cfg.settingsModule;
    };
    preStart = ''
      ${cfg.package}/bin/django-admin migrate
    '';

    serviceConfig = {
      Type = cfg.unitMode;
      ExecStart = "${cfg.package}/bin/gunicorn ${cfg.wsgiEntryPoint} -p ${toString cfg.port}";
    } // (if cfg.environmentFile == null then {} else {
      EnvironmentFile = cfg.environmentFile;
    });
  }) enabledApps;
}
