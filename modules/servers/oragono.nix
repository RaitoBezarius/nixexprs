{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.oragono;
  settingsFile = (pkgs.writeText "ircd.yaml" (builtins.toJSON cfg.settings));
in
  {
    options.services.oragono = {
      enable = mkEnableOption "Enable the Oragono IRC server";
      group = mkOption { default = "oragono"; };
      user = mkOption { default = "oragono";};
      stateDirectory = mkOption { default = "/var/lib/oragono"; };
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
      users.groups.${cfg.group} = {};
      users.users.${cfg.user} = {};

      systemd.services.oragono = {
        description = "Oragono IRC server";

        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];

        preStart = ''
          mkdir -p ${cfg.stateDirectory}
        '';

        serviceConfig = {
          Type = "simple";
          User = cfg.user;
          Group = cfg.group;
          WorkingDirectory = cfg.stateDirectory;
          ExecStart = "${cfg.package}/bin/oragono run --conf ${settingsFile}";
          ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
          Restart = "on-failure";
          LimitNOFILE = "1048576";
        };
      };
      systemd.services.oragono-init = {
        description = "Oragono IRC server initialization (mkcerts)";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];
        preStart = ''
          mkdir -p ${cfg.stateDirectory}
        '';
        serviceConfig = {
          Type = "oneshot";
          User = cfg.user;
          Group = cfg.group;
          WorkingDirectory = cfg.stateDirectory;
          ExecStart = "${cfg.package}/bin/oragono mkcerts --conf ${settingsFile}";
          RemainAfterExit = false;
        };
      };
    };
  }

