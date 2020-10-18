{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.oragono;
  settingsFile = (pkgs.writeFile "ircd.yaml" (generators.toYAML cfg.settings));
in
  {
    options.services.oragono = {
      enable = mkEnableOption "Enable the Oragono IRC server";
      group = mkOption { };
      user = mkOption { };
      package = mkOption {
        description = "Package used to run Oragono";
        default = pkgs.oragono;
        defaultText = "pkgs.oragono";
        type = types.package;
      };
      settings = mkOption {
        description = "IRCd settings which will be transformed into a YAML file";
      };
    };

    config = {
      groups.${cfg.group} = {};
      users.users.${cfg.user} = {};

      systemd.services.oragono = {
        description = "Oragono IRC server";

        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
          Type = "simple";
          User = cfg.user;
          WorkingDirectory = cfg.stateDirectory;
          ExecStart = "${cfg.package}/bin/oragono run --conf ${settingsFile}";
          ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
          Restart = "on-failure";
          LimitNOFILE = "1048576";
        };
      };
    };
  }

