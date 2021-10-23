{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.errbot;
  env = cfg.pythonPackage.buildEnv.override {
    extraLibs = [ cfg.package ] ++ cfg.extraPythonPackages;
  };
in
  {
    options.services.errbot = {
      enable = mkEnableOption "Errbot, a chat bot";
      configFile = mkOption {
        type = types.path;
      };
      extraPythonPackages = mkOption {
        type = types.listOf types.package;
        default = [];
      };
      pythonPackage = mkOption {
        type = types.package;
        default = pkgs.python3;
        defaultText = "pkgs.python3";
      };
      package = mkOption {
        type = types.package;
        default = pkgs.errbot;
        defaultText = "pkgs.errbot";
      };
      user = mkOption {
        type = types.str;
        default = "errbot";
      };
      group = mkOption {
        type = types.str;
        default = "errbot";
      };
    };
    config = {
      users.users.${cfg.user} = {
        isSystemUser = true;
        inherit (cfg) group;
      };
      users.groups.${cfg.group} = {};
      systemd.services.errbot = {
        description = "Errbot: a chat bot";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
          Type = "simple";
          User = cfg.user;
          Group = cfg.group;
          StateDirectory = "errbot";
          WorkingDirectory = "$STATE_DIRECTORY";
          LogsDirectory = "errbot";
          Restart = "always";
          ExecStart = "${env}/bin/errbot -c ${cfg.configFile}";
          KillSignal = "SIGINT";
        };
      };
    };
  }
