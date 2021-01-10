{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.sniproxy;
  settingsFile = (pkgs.writeText "sniproxy-cfg" cfg.settings);
  mkListener = listener: ''
    listener ${listener.address}:${listener.port} {
      protocol ${listener.protocol}

      table ${listener.table}

      ${optionalString (listener.fallback != null) "fallback ${listener.fallback}"}
    }

  '';
  mkTableRule = rule: ''
    ${rule.match} ${rule.dest}

  '';
  mkTable = table: ''
    table ${table.name} {
      ${concatMapStrings mkTableRule table.rules}
    }

  '';
  settingsContents = ''
    user ${cfg.user}
    group ${cfg.group}

    error_log {
      syslog daemon
      priority notice
    }

    access_log {
      syslog daemon
    }

    ${concatMapStrings mkListener cfg.listeners}

    ${cfg.extraConfig}
  '';

  listenerOpts = {
    options = {
      address = mkOption {
        description = "IP Address to listen on";
        example = "127.0.0.1";
        default = "127.0.0.1";
        types = types.str;
      };

      port = mkOption {
        description = "Port to listen on";
        example = 443;
        default = 443;
        types = types.port;
      };

      protocol = mkOption {
        description = "Protocol to use";
        type = types.str;
        example = "tls";
        default = "tls";
      };

      table = mkOption {
        description = "Table to use";
        type = types.str;
        example = "vhosts";
      };

      fallback = mkOption {
        description = "Fallback to use for direct access";
        type = types.nullOr types.str;
        example = "192.168.0.5:8000";
      };
    };
  };

  ruleOpts = {
    options = {
      match = mkOption {
        description = "Regex to match on the hostname";
        type = types.str;
        example = ".*\\\\.com";
      };
      dest = mkOption {
        description = "Destination IP address/port";
        type = types.str;
        example = "[2001:DB8::1:10]";
      };
    };
  };

in
  {
    options.services.sniproxy = {
      enable = mkEnableOption "Enable the SNI proxy (sniproxy) server";
      group = mkOption { default = "sniproxy"; };
      user = mkOption { default = "sniproxy";};
      stateDirectory = mkOption { default = "/var/lib/sniproxy"; };
      package = mkOption {
        description = "Package used to run sniproxy";
        default = pkgs.sniproxy;
        defaultText = "pkgs.sniproxy";
        type = types.package;
      };

      listeners = mkOption {
        description = "Listeners section";
        type = with types; nullOr (listOf (submodule listenersOpts);
        example = ''
          [ { address = "127.0.0.1"; port = 443; protocol = "tls"; table = "vhosts"; fallback = "192.0.2.5:443"; } ]
        '';
        default = null;
      };

      tables = mkOption {
        description = "Tables (rules to match hostnames with their IP addresses)";
        type = with types; nullOr (attrsOf (listOf (submodule ruleOpts)));
        example = ''
          { vhosts = [
            { match = "example.com"; dest = "192.0.2.10:4343"; }
            { match = "example.net"; dest = "[2001:DB8::1:10]"; }
            { match = ".*\\.com"; dest= "[2001:DB8::1:11]:443"; }
            { match = ".*\\.edu"; dest = "*:443"; }
          ]; }
        '';
      };

      extraConfig = mkOption {
        description = "Configuration to be appended";
        default = "";
        type = types.str;
      };

      settings = mkOption {
        description = "SNIProxy text configuration";
        default = settingsContents;
      };
    };

    config = mkIf cfg.enable {
      users.groups.${cfg.group} = {};
      users.users.${cfg.user} = {};

      systemd.services.sniproxy = {
        description = "SNIProxy (sniproxy) server";

        after = [ "network-online.target" "syslog.target" ];
        wantedBy = [ "multi-user.target" ];

        preStart = ''
          mkdir -p ${cfg.stateDirectory}
        '';

        serviceConfig = {
          Type = "forking";
          User = cfg.user;
          Group = cfg.group;
          WorkingDirectory = cfg.stateDirectory;
          ExecStart = "${cfg.package}/bin/sniproxy -c ${cfg.settingsFile} -f";
          Restart = "always";
        };
      };
    };
  }

