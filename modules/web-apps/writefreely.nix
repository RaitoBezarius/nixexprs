{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.writefreely;
  iniFormat = pkgs.formats.ini {};
  generatedConfigFile = iniFormat.generate "writefreely.ini" cfg.settings;
in
  {
    options.services.writefreely = {
      enable = mkEnableOption "Enable WriteFreely blog platform";
      package = mkOption {
        type = types.package;
        defaultText = "pkgs.writefreely";
        default = pkgs.writefreely;
      };
      configFile = mkOption {
        type = types.path;
        default = generatedConfigFile;
      };
      settings = mkOption {
        type = types.submodule {
          freeformType = iniFormat.type;
        };
      };
    };

    config = mkIf cfg.enable {
      environment.systemPackages = [
        (pkgs.writeScriptBin "manage-writefreely" ''
          #!${pkgs.stdenv.runtimeShell}
          ${cfg.package}/bin/writefreely -c ${cfg.configFile} "$@"
        '')
      ];

      systemd.services.writefreely = {
        wantedBy = [ "multi-user.target" ];
        description = "WriteFreely instance";
        after = [ "syslog.target" "network.target"];

        preStart = ''
          if [ ! -f .keys-generated ]; then
            ${cfg.package}/bin/writefreely -c ${cfg.configFile} keys generate
            touch .keys-generated
          fi

          if [ ! -f .db-init ]; then
            ${cfg.package}/bin/writefreely -c ${cfg.configFile} --init-db
            touch .db-init
          fi

          ${cfg.package}/bin/writefreely -c ${cfg.configFile} --migrate
        '';

        serviceConfig = {
          Type = "simple";
          StandardOutput = "syslog";
          StandardError = "syslog";
          StateDirectory = "writefreely";
          WorkingDirectory = "/var/lib/writefreely";
          ExecStart = "${cfg.package}/bin/writefreely -c ${cfg.configFile}";
          Restart = "always";
          PrivateTmp = true;
        };
      };
    };
  }
