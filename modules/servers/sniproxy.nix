{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.sniproxy;
  settingsFile = (pkgs.writeText "sniproxy-cfg" cfg.settings);
  mkListener = listener: ''
    listener ${listener.address}:${toString listener.port} {
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
  mkResolver = resolver: ''
    resolver {
      ${optionalString (resolver.nameserver != null) "nameserver ${resolver.nameserver}"}
      ${optionalString (resolver.mode != null) "mode ${resolver.mode}"}
    }

  '';
  settingsContents = ''
    user ${cfg.user}
    group ${cfg.group}

    ${optionalString (cfg.resolver != null) (mkResolver cfg.resolver)}

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
        type = types.str;
      };

      port = mkOption {
        description = "Port to listen on";
        example = 443;
        default = 443;
        type = types.port;
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

  resolverOpts = {
    options = {
      nameserver = mkOption {
        description = "DNS server to use for downstream resolution";
        type = types.nullOr types.str;
        default = null;
        example = "1.1.1.1";
      };

      mode = mkOption {
        description = "Mode for resolution (e.g. ipv6_first, ipv6_only, ipv4_only)";
        type = types.nullOr types.str;
        default = null;
        example = "ipv6_first";
      };
    };
  };
in
  {
    # Disable nixpkgs module.
    disabledModules = [ "services/networking/sniproxy.nix" ];

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

      resolver = mkOption {
        description = "Resolver to use in sniproxy downstream resolution";
        default = null;
        type = types.nullOr (types.submodule resolverOpts);
        example = ''
          { nameserver = "1.1.1.1"; mode = "ipv6_first"; }
        '';
      };

      listeners = mkOption {
        description = "Listeners section";
        type = with types; nullOr (listOf (submodule listenerOpts));
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

      systemd.tmpfiles.rules = [
        "d '${cfg.stateDirectory}' - ${cfg.user} ${cfg.group} - -"
      ];

      systemd.services.sniproxy = {
        description = "SNIProxy (sniproxy) server";

        after = [ "network.target" "systempd-tmpfiles-setup.service" ];
        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
          Type = "forking";
          User = cfg.user;
          Group = cfg.group;
          WorkingDirectory = cfg.stateDirectory;
          ExecStart = "${cfg.package}/bin/sniproxy -c ${settingsFile} -f";
          Restart = "always";
        };
      };
    };
  }

