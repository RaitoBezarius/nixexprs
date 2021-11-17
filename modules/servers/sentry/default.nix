{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.sentry;
in
{
  options.services.sentry = {
    enable = mkEnableOption "Enable the error and exceptions collecting server Sentry";
    package = mkOption {
      type = types.package;
      default = pkgs.sentry;
      defaultText = "pkgs.sentry";
    };
    settings = mkOption {
      type = settingsFormat.type;
      default = {};
    };

    user = mkOption {
      type = types.str;
      default = "sentry";
    };
    group = mkOption {
      type = types.str;
      default = "sentry";
    };
  };

  config = mkIf cfg.enable {
    services.sentry = {
      snuba.enable = mkDefault true;
      symbolicator.enable = mkDefault true;
      relay.enable = mkDefault true;
      settings = {
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
    };

    # TODO: systemd for sentry
    # TODO: nginx vhost.

    users.groups.${cfg.group} = {};
    users.users.${cfg.user} = {
      inherit (cfg) group;
      isSystemUser = true;
    };

    services.postgresql = {
    };
    services.apache-kafka = {
      enable = true;
      # TODO: prefill kafka topics.
    };
    services.zookeeper = {
      enable = true;
    };
  };
}
