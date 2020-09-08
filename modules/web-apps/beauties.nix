{ lib, pkgs, ... }:
with lib;
let
  cfg = config.services.beauties;
in
{
  options.services.beauties = {
    enable = mkEnableOption "Enable the Beauties service";
    enableCleanup = mkEnableOption "Enable the cleanup timer";
    cleanupEvery = mkOption {
      type = types.integer;
      default = 14;
    };
    package = mkOption {
      type = types.package;
      defaultText = "pkgs.beauties";
      default = pkgs.beauties;
    };
    storageDir = mkOption {
      type = types.str;
      default = "/var/lib/beauties";
    };
    tmpDir = mkOption {
      type = types.str;
      default = "/var/lib/beauties/tmp";
    };
    ip = mkOption {
      type = types.str;
      default = "";
    };
    port = mkOption {
      type = types.port;
      default = 8080;
    };
    domain = mkOption {
      type = types.nullOr types.str;
      default = null;
    };
    minimumFreeSpace = mkOption {
      type = types.nullOr types.str;
      default = null;
    };
  };

  config = mkIf cfg.enable {
    systemd.services.beauties = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      description = "Beauties daemon: personal essential internet service";

      preStart = ''
        [ ! -d ${cfg.storageDir} ] && mkdir -p ${cfg.storageDir}
        [ ! -d ${cfg.tmpDir} ] && mkdir -p ${cfg.tmpDir}
      '';

      serviceConfig = {
        Type = "simple";
        ExecStart = ''${cfg.package}/bin/beauties \
          -b ${cfg.ip}:${builtins.toString cfg.port} \
          -s ${cfg.storageDir} \
          -t ${cfg.tmpDir} \
          ${optionalString (cfg.domain != null) "-d ${cfg.domain} \\"}
          ${optionalString (cfg.minimumFreeSpace != null) "-m ${cfg.minimumFreeSpace}"}'';
        Restart = "always";
        RestartSec = "13";
      };
    };

    systemd.services.beauties-cleanup = mkIf cfg.enableCleanup {
      description = "Beauties: files cleanup";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.find} -P "${cfg.storageDir}" -maxdepth 1 -type f -ctime +${builtins.toString cfg.cleanupEvery} -execdir rm -f {} \\;";
        StandardOutput = "syslog";
        StandardError = "syslog";
      };
    };
  };
}
