{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.isso;
  settingsFormat = pkgs.formats.ini {};
  cfgFile = settingsFormat.generate "isso.cfg" cfg.settings;
in
{
  options.services.isso = {
    enable = mkEnableOption "Enable the commenting server isso";
    package = mkOption {
      type = types.package;
      default = pkgs.isso;
      defaultText = "pkgs.isso";
    };
    settings = mkOption {
      type = settingsFormat.type;
      default = {};
    };

    user = mkOption {
      type = types.str;
      default = "isso";
    };
    group = mkOption {
      type = types.str;
      default = "isso";
    };
  };

  config = mkIf cfg.enable {
    services.isso.settings = {
      general = {
        dbpath = mkDefault "/var/lib/isso/comments.db";
        gravatar = mkDefault false;
      };
      moderation = {
        enabled = mkDefault false;
      };
      server = {
        listen = mkDefault "http://localhost:8000";
      };
    };

    users.groups.${cfg.group} = {};
    users.users.${cfg.user} = {
      isSystemUser = true;
    };

    # TODO: use uwsgi.
    systemd.services.isso = {
      description = "Isso: a commenting server";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "simple";
        User = cfg.user;
        Group = cfg.group;
        StateDirectory = "isso";
        Restart = "always";
        ExecStart = "${cfg.package}/bin/isso -c ${cfgFile} run";
      };
    };
  };
}
