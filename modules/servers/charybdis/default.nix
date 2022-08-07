{ config, lib, pkgs, ... }:

# TODO: not all of the syntax is supported, help to improve the module to support your syntax.
# TODO: support for modules { module = ... } for rehash/reload.
# TODO: improve typing for freeform settings for complicated stuff.
# TODO: provide basic assertions.
# TODO: test solanum over this.
# TODO: how to do secret injection at runtime securely? sed?
# TODO: plug-in ACME for automatic TLS
# TODO: fingerprint auto-update feature with systemd timer — generic hook

let
  inherit (lib)
    mkEnableOption mkIf mkOption types concatStringsSep mapAttrsToList
    all trace toposort nameValuePair optionalString concatMap;
  inherit (pkgs) coreutils;
  cfg = config.services.charybdis;
  stateDir =
    "/var/lib/${config.systemd.services.charybdis.serviceConfig.StateDirectory}";
  logDir =
    "/var/log/${config.systemd.services.charybdis.serviceConfig.LogsDirectory}";

  mkLoadExtension = ext: ''loadmodule "${ext}";'';
  mkRaw = v: { raw = v; };
  mkValue = v:
    if builtins.isString v then
      ''"${v}"''
    else if builtins.isInt v then
      "${toString v}"
    else if builtins.isBool v then
      (if v then "yes" else "no")
    else if builtins.isList v then
      concatStringsSep ", " (map mkValue v)
    else if builtins.isAttrs v then
      (if v ? raw then
        (if builtins.isList v.raw then
          (concatStringsSep ", " v.raw)
        else
          "${toString v.raw}")
      else
        (throw (trace v (''
          Unsupported attribute set, only raw node are supported of the form { raw = "some string"; }''))))
    else
      throw (trace v "Unsupported type of value!");
  mkKeyValue = k: v: "${k} = ${mkValue v};";
  mkSimpleBlock = title: value: ''
    ${title} {
      ${concatStringsSep "\n" (mapAttrsToList mkKeyValue value)}
    };
  '';
  mkInternallyRepeatedBlock = title: values: ''
    ${title} {
      ${concatStringsSep "\n" (concatMap (attrs: mapAttrsToList mkKeyValue attrs) values)}
    };
  '';
  areAllValuesAttrs = e:
    all (child: builtins.isAttrs child) (builtins.attrValues e);
  subBlockTitle = title: subBlock: ''${title} "${subBlock}"'';
  mkMultipleBlocks = title: subBlocks:
    concatStringsSep "\n"
    (mapAttrsToList (subBlock: mkSimpleBlock (subBlockTitle title subBlock))
      subBlocks);
  mkRepeatedBlock = title: list:
    concatStringsSep "\n" (map (mkSimpleBlock title) list);
  mkBlock = key: value:
    if builtins.isList value then
      mkRepeatedBlock key value
    else if builtins.isAttrs value && areAllValuesAttrs value then
      mkMultipleBlocks key value
    else
      mkSimpleBlock key value;
  # Those have to be ordered first.
  # class before auth and connect.
  # auth in a precedence order.
  # privset before operator.
  # privset extends has to be defined before being used.
  specialAttrs = [ "class" "privset" "auth" "blacklist" ];
  # b should be after a iff b extends clause is a's name
  # e.g.
  # privset "hello" { ... }
  # privset "world" { extends = "another"; }
  # would yield [ "world" "hello" ]
  # but
  # privset "hello" { ... }
  # privset "world" { extends = "hello"; }
  # would yield [ "hello" "world" ]
  # do a depends on b?
  privsetDependsOn = a: b:
    if a.value ? extends then a.value.extends == b.name else false;
  orderedPrivsets = (toposort (a: b: privsetDependsOn b a)
    (mapAttrsToList nameValuePair cfg.settings.privset)).result;
  configContents = ''
    /* Generated by Nix */
    /* Extensions */
    ${concatStringsSep "\n" (map mkLoadExtension cfg.extensions)}

    /* Blocks */
    ${mkBlock "class" cfg.settings.class}
    ${concatStringsSep "\n"
    (map ({ name, value }: mkSimpleBlock (subBlockTitle "privset" name) value)
      orderedPrivsets)}
    ${concatStringsSep "\n"
    (map (mkSimpleBlock "auth") (cfg.settings.auth or [ ]))}
    ${concatStringsSep "\n"
    (mapAttrsToList mkBlock (removeAttrs cfg.settings specialAttrs))}
    ${mkInternallyRepeatedBlock "blacklist" (cfg.settings.blacklist or [])}

    ${optionalString ((builtins.length cfg.modulesDirectories) > 0) ''
      /* Modules path */
      modules {
        ${
          concatStringsSep "\n"
          (map (p: ''path = "${p}"'') cfg.modulesDirectories)
        }
      };
    ''}
  '';

in {

  ###### interface

  options = {

    services.charybdis = {

      enable = mkEnableOption "Charybdis IRC daemon";
      package = mkOption {
        type = types.package;
        default = pkgs.charybdis;
        defaultText = "pkgs.charybdis";
      };

      modulesDirectories = mkOption {
        type = types.listOf types.str;
        description = ''
          List of module paths to search for module specified in extensions
          and during /modload.
        '';
        example = [
          "/var/lib/charybdis/modules"
          "/var/lib/charybdis/modules/autoload"
        ];
        default = [ ];
      };

      extensions = mkOption {
        type = types.listOf types.str;
        description = ''
          List of extensions to load.
        '';
        example = [ "extensions/ip_cloaking_4.0" "extensions/hurt" ];
        default = [
          "extensions/chm_adminonly"
          "extensions/chm_nonotice"
          "extensions/chm_operonly"
          "extensions/chm_sslonly"
          "extensions/chm_operonly_compat"
          "extensions/chm_quietunreg_compat"
          "extensions/chm_sslonly_compat"
          "extensions/chm_operpeace"
          "extensions/extb_account"
          "extensions/extb_canjoin"
          "extensions/extb_channel"
          "extensions/extb_combi"
          "extensions/extb_extgecos"
          "extensions/extb_hostmask"
          "extensions/extb_oper"
          "extensions/extb_realname"
          "extensions/extb_server"
          "extensions/extb_ssl"
          "extensions/extb_usermode"
          "extensions/helpops"
          "extensions/hurt"
          "extensions/ip_cloaking_4.0"
          "extensions/m_extendchans"
          "extensions/m_findforwards"
          "extensions/m_identify"
          "extensions/m_locops"
          "extensions/sno_farconnect"
          "extensions/sno_globalkline"
          "extensions/sno_globalnickchange"
          "extensions/sno_globaloper"
          "extensions/sno_whois"
          "extensions/override"
          "extensions/no_kill_services"
        ];
      };

      settings = mkOption {
        type = types.attrsOf types.anything; # TODO: better types here.
        description = ''
          Charybdis IRC daemon settings.
        '';
      };

      configFile = mkOption {
        type = types.path;
        default = pkgs.writeText "charbydis.conf" configContents;
      };

      user = mkOption {
        type = types.str;
        default = "ircd";
        description = ''
          Charybdis IRC daemon user.
        '';
      };

      group = mkOption {
        type = types.str;
        default = "ircd";
        description = ''
          Charybdis IRC daemon group.
        '';
      };

      motd = mkOption {
        type = types.nullOr types.lines;
        default = null;
        description = ''
          Charybdis MOTD text.

          Charybdis will read its MOTD from /etc/charybdis/ircd.motd .
          If set, the value of this option will be written to this path.
        '';
      };
    };

  };

  ###### implementation
  config = mkIf cfg.enable (lib.mkMerge [
    {
      users.users.${cfg.user} = {
        description = "Charybdis IRC daemon user";
        uid = config.ids.uids.ircd;
        group = cfg.group;
      };

      users.groups.${cfg.group} = { gid = config.ids.gids.ircd; };

      environment.etc."charybdis/charybdis.conf" = { source = cfg.configFile; };

      security.dhparams = {
        enable = true;
        params."charybdis".bits = 2048; # Is it good enough?
      };

      systemd.services.charybdis = {
        description = "Charybdis IRC daemon";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];
        environment = { BANDB_DBPATH = "${stateDir}/ban.db"; };
        stopIfChanged = false;
        reloadIfChanged = true;
        serviceConfig = {
          ExecStart =
            "${cfg.package}/bin/charybdis -foreground -logfile /dev/stdout -configfile /etc/charybdis/charybdis.conf";
          ExecReload = "${coreutils}/bin/kill -1 $MAINPID";
          StateDirectory = "charybdis";
          LogsDirectory = "charybdis";
          Group = cfg.group;
          User = cfg.user;
          Restart = "always";
          RestartSec = "10s";

          LockPersonality = true;
          NoNewPrivileges = true;
          PrivateDevices = true;
          PrivateTmp = true;
          PrivateUsers = true;
          ProtectClock = true;
          ProtectControlGroups = true;
          ProtectHome = true;
          ProtectHostname = true;
          ProtectKernelLogs = true;
          ProtectKernelModules = true;
          ProtectKernelTunables = true;
          ProtectProc = "invisible";
          ProtectSystem = "strict";
          RestrictRealtime = true;
          RestrictNamespaces = true;
          RestrictSUIDSGID = true;
          RestrictAddressFamilies = [ "AF_INET" "AF_INET6" ];
          SystemCallFilter = [ "@system-service" "~@privileged" "~@resources" ];
          SystemCallArchitectures = "native";
          CapabilityBoundingSet = "";
          MemoryDenyWriteExecute = true;
          RemoveIPC = true;
        };
      };

      systemd.services.charybdis-config-reload = {
        wants = [ "charybdis.service" ];
        wantedBy = [ "multi-user.target" ];
        restartTriggers = [ cfg.configFile ];
        serviceConfig.Type = "oneshot";
        serviceConfig.TimeoutSec = 60;
        script = ''
              if /run/current-system/systemd/bin/systemctl -q is-active charybdis.service ; then
          	/run/current-system/systemd/bin/systemctl reload charybdis.service
              fi
        '';
        serviceConfig.RemainAfterExit = true;
      };

      services.charybdis.settings.serverinfo = {
        ssl_dh_params =
          lib.mkDefault config.security.dhparams.params."charybdis".path;
      };

      # To express raw nodes in Charbydis configuration, create a nested attr with a raw field.
      # It will serialized as-is, except if it is a list, in that case, it will be (join over , (map serializeRaw list)).

      services.charybdis.settings.general = {
        hide_error_messages.raw = lib.mkDefault "opers";
        hide_spoof_ips = lib.mkDefault true;
        default_umodes = lib.mkDefault "+ix";
        default_operstring = lib.mkDefault "is an IRC Operator";
        default_adminstring = lib.mkDefault "is a Server Administrator";
        servicestring = lib.mkDefault "is a Network Service";
        sasl_service = lib.mkDefault "SaslServ";
        disable_fake_channels = lib.mkDefault false;
        tkline_expire_notices = lib.mkDefault false;
        default_floodcount = lib.mkDefault 10;
        failed_oper_notice = lib.mkDefault true;
        dots_in_ident = lib.mkDefault 2;

        min_nonwildcard = lib.mkDefault 4;
        min_nonwildcard_simple = lib.mkDefault 3;
        max_accept = lib.mkDefault 20;
        max_monitor = lib.mkDefault 100;

        anti_nick_flood = lib.mkDefault true;
        max_nick_time.raw = lib.mkDefault "20 seconds";
        max_nick_changes = lib.mkDefault 5;

        anti_spam_exit_message_time.raw = lib.mkDefault "5 minutes";

        ts_warn_delta.raw = lib.mkDefault "30 seconds";
        ts_max_delta.raw = lib.mkDefault "5 minutes";

        client_exit = lib.mkDefault true;

        collision_fnc = lib.mkDefault true;
        resv_fnc = lib.mkDefault true;

        global_snotices = lib.mkDefault true;

        dline_with_reason = lib.mkDefault true;
        kline_with_reason = lib.mkDefault true;
        kline_reason = lib.mkDefault "Connection closed";

        identify_service = lib.mkDefault "NickServ@services.int";
        identify_command = lib.mkDefault "IDENTIFY";

        non_redundant_klines = lib.mkDefault true;
        warn_no_nline = lib.mkDefault true;

        use_propagated_bans = lib.mkDefault true;

        stats_e_disabled = lib.mkDefault false;
        stats_c_oper_only = lib.mkDefault false;
        stats_h_oper_only = lib.mkDefault false;
        stats_y_oper_only = lib.mkDefault false;
        stats_o_oper_only = lib.mkDefault false;
        stats_P_oper_only = lib.mkDefault false;
        stats_i_oper_only.raw = lib.mkDefault "masked";
        stats_k_oper_only.raw = lib.mkDefault "masked";

        map_oper_only = lib.mkDefault false;
        operspy_admin_only = lib.mkDefault false;
        operspy_dont_care_user_info = lib.mkDefault false;

        caller_id_wait.raw = lib.mkDefault "1 minute";

        pace_wait_simple.raw = lib.mkDefault "1 second";
        pace_wait.raw = lib.mkDefault "10 seconds";

        short_motd = lib.mkDefault false;
        ping_cookie = lib.mkDefault false;

        connect_timeout.raw = lib.mkDefault "30 seconds";
        default_ident_timeout = lib.mkDefault 5;

        disable_auth = lib.mkDefault false;

        no_oper_flood = lib.mkDefault true;

        max_targets = lib.mkDefault 4;

        use_whois_actually = lib.mkDefault true;

        oper_only_umodes.raw =
          lib.mkDefault [ "operwall" "locops" "servnotice" ];
        oper_umodes.raw =
          lib.mkDefault [ "locops" "servnotice" "operwall" "wallop" ];
        oper_snomask = lib.mkDefault "+s";

        burst_away = lib.mkDefault true;

        nick_delay = lib.mkDefault 0;

        reject_ban_time.raw = lib.mkDefault "1 minute";
        reject_after_count = lib.mkDefault 3;
        reject_duration.raw = lib.mkDefault "5 minutes";

        throttle_duration = lib.mkDefault 60;
        throttle_count = lib.mkDefault 4;

        client_flood_max_lines = lib.mkDefault 20;

        client_flood_burst_rate = lib.mkDefault 40;
        client_flood_burst_max = lib.mkDefault 5;
        client_flood_message_time = lib.mkDefault 1;
        client_flood_message_num = lib.mkDefault 2;

        max_ratelimit_tokens = lib.mkDefault 30;

        away_interval = lib.mkDefault 30;

        certfp_method.raw = lib.mkDefault "spki_sha256";
        hide_opers_in_whois = lib.mkDefault false;
      };

      services.charybdis.settings.log = {
        fname_operlog = lib.mkDefault "${logDir}/operlog";
        fname_foperlog = lib.mkDefault "${logDir}/foperlog";
        fname_serverlog = lib.mkDefault "${logDir}/serverlog";
        fname_klinelog = lib.mkDefault "${logDir}/klinelog";
        fname_killlog = lib.mkDefault "${logDir}/killlog";
        fname_operspylog = lib.mkDefault "${logDir}/operspylog";
        fname_ioerrorlog = lib.mkDefault "${logDir}/ioerror";
      };

      services.charybdis.settings.channel = {
        use_invex = lib.mkDefault true;
        use_except = lib.mkDefault true;
        use_forward = lib.mkDefault true;
        use_knock = lib.mkDefault true;

        max_chans_per_user = lib.mkDefault 100;
        max_chans_per_user_large = lib.mkDefault 200;
        max_bans = lib.mkDefault 100;
        max_bans_large = lib.mkDefault 500;

        default_split_user_count = lib.mkDefault 0;
        default_split_server_count = lib.mkDefault 0;
        no_create_on_split = lib.mkDefault false;
        no_join_on_split = lib.mkDefault false;
        burst_topicwho = lib.mkDefault true;
        kick_on_split_riding = lib.mkDefault false;

        only_ascii_channels = lib.mkDefault false;

        resv_forcepart = lib.mkDefault true;

        channel_target_change = lib.mkDefault true;
        disable_local_channels = lib.mkDefault false;
        autochanmodes = lib.mkDefault "+nt";
        displayed_usercount = lib.mkDefault 3;
        strip_topic_colors = lib.mkDefault false;

        knock_delay.raw = lib.mkDefault "5 minutes";
        knock_delay_channel.raw = lib.mkDefault "1 minute";
      };

      services.charybdis.settings.blacklist = lib.mkDefault [{
        host = "rbl.efnetrbl.org";
        type.raw = "ipv4";
        reject_reason =
          "\${nick}, your IP (\${ip}) is listed in EFnet's RBL. For assistance, see http://efnetrbl.org/?i=\${ip}";
      }];

      services.charybdis.settings.serverhide = {
        flatten_links = lib.mkDefault true;
        links_delay.raw = lib.mkDefault "5 minutes";
        hidden = lib.mkDefault false;
        disable_hidden = lib.mkDefault false;
      };

      services.charybdis.settings.alias = {
        "NickServ".target = lib.mkDefault "NickServ";
        "ChanServ".target = lib.mkDefault "ChanServ";
        "OperServ".target = lib.mkDefault "OperServ";
        "MemoServ".target = lib.mkDefault "MemoServ";
        "NS".target = lib.mkDefault "NickServ";
        "CS".target = lib.mkDefault "ChanServ";
        "OS".target = lib.mkDefault "OperServ";
        "MS".target = lib.mkDefault "MemoServ";
      };

      services.charybdis.settings.class = {
        users = {
          ping_time.raw = lib.mkDefault "2 minutes";
          number_per_ident = lib.mkDefault 10;
          number_per_ip = lib.mkDefault 10;
          number_per_ip_global = lib.mkDefault 50;
          cidr_ipv4_bitlen = lib.mkDefault 24;
          cidr_ipv6_bitlen = lib.mkDefault 64;
          number_per_cidr = lib.mkDefault 200;
          max_number = lib.mkDefault 3000;
          sendq.raw = lib.mkDefault "400 kbytes";
        };
        webusers = {
          ping_time.raw = lib.mkDefault "2 minutes";
          number_per_ident = lib.mkDefault 50;
          number_per_ip = lib.mkDefault 50;
          number_per_ip_global = lib.mkDefault 50;
          cidr_ipv4_bitlen = lib.mkDefault 24;
          cidr_ipv6_bitlen = lib.mkDefault 64;
          number_per_cidr = lib.mkDefault 300;
          max_number = lib.mkDefault 1000;
          sendq.raw = lib.mkDefault "1000 kbytes";
        };
        restricted = {
          ping_time.raw = lib.mkDefault "1 minute 30 seconds";
          number_per_ip = lib.mkDefault 1;
          max_number = lib.mkDefault 100;
          sendq.raw = lib.mkDefault "60 kbytes";
        };
        opers = {
          ping_time.raw = lib.mkDefault "5 minutes";
          number_per_ip = lib.mkDefault 30;
          max_number = lib.mkDefault 100;
          sendq.raw = lib.mkDefault "2 megabyte";
        };
        server = {
          ping_time.raw = lib.mkDefault "5 minutes";
          connectfreq.raw = lib.mkDefault "5 minutes";
          max_number = lib.mkDefault 1;
          sendq.raw = lib.mkDefault "4 megabytes";
        };
      };

      services.charybdis.settings.privset = {
        local_op = {
          privs.raw = lib.mkDefault [
            "oper:general"
            "oper:privs"
            "oper:testline"
            "oper:local_kill"
            "oper:operwall"
            "usermode:servnotice"
            "auspex:oper"
            "auspex:hostname"
            "auspex:umodes"
            "auspex:cmodes"
          ];
        };

        server_bot = {
          extends = lib.mkDefault "local_op";
          privs.raw = lib.mkDefault [
            "oper:kline"
            "oper:remoteban"
            "snomask:nick_changes"
          ];
        };

        global_op = {
          extends = lib.mkDefault "local_op";
          privs.raw = lib.mkDefault [
            "oper:global_kill"
            "oper:routing"
            "oper:kline"
            "oper:unkline"
            "oper:xline"
            "oper:resv"
            "oper:cmodes"
            "oper:mass_notice"
            "oper:remoteban"
          ];
        };

        admin = {
          extends = lib.mkDefault "global_op";
          privs.raw = lib.mkDefault [
            "oper:admin"
            "oper:die"
            "oper:rehash"
            "oper:spy"
            "oper:grant"
          ];
        };
      };
    }

    (mkIf (cfg.motd != null) {
      environment.etc."charybdis/ircd.motd".text = cfg.motd;
    })
  ]);
}
