{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.services.etebase-server;

  pythonEnv = cfg.package.python.buildEnv.override {
    extraLibs = cfg.package.runtimePackages ++ [ cfg.package ];
  };

  dbConfig = {
    sqlite3 = ''
      engine = django.db.backends.sqlite3
      name = db.sqlite3
    '';
  };

  configIni = toString (pkgs.writeText "etebase-server.ini" ''
    [global]
    secret_file = ${if cfg.secretFile != null then cfg.secretFile else ""}
    debug = false

    [allowed_hosts]
    allowed_host1 = ${cfg.host}
    ${if cfg.domain != null then ''allowed_host2 = ${cfg.domain}'' else ""}

    [database]
    ${dbConfig."${cfg.database.type}"}
  '');

  defaultUser = "etebase-server";
in
{
  options = {
    services.etebase-server = {
      enable = mkEnableOption "Etebase server";

      # TODO where to put this documentation?
      # To create an admin user run the shell command <literal>etebase-server createsuperuser</literal>.
      # Then you can login & create accounts on www.your-etesync-install.com/admin

      secretFile = mkOption {
        default = null;
        type = with types; nullOr str;
        description = ''
          The path to a file containing the secret
          used as django's SECRET_KEY.
        '';
      };

      dataDir = mkOption {
        type = types.str;
        default = "/var/lib/etebase-server";
        description = "Directory to store the Etebase server data.";
      };

      port = mkOption {
        type = with types; nullOr port;
        default = 8001;
        description = ''
          Port to listen on. If <literal>null</literal>, it won't listen on
          any port.
        '';
      };

      openFirewall = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to open ports in the firewall for the server.
        '';
      };

      host = mkOption {
        type = types.str;
        default = "0.0.0.0";
        example = "localhost";
        description = ''
          Host to listen on.
        '';
      };

      unixSocket = mkOption {
        type = with types; nullOr str;
        default = null;
        description = "The path to the socket to bind to.";
        example = "/run/etebase-server/etebase-server.sock";
      };

      domain = mkOption {
        type = with types; nullOr str;
        default = null;
        description = "The domain the Etebase instance runs on.";
      };

      database = {
        type = mkOption {
          type = types.enum [ "sqlite3" ];
          default = "sqlite3";
          description = ''
            Database engine to use.
            Currently only sqlite3 is supported.
            Other options can be configured using <literal>extraConfig</literal>.
          '';
        };
      };

      # TODO add validation with other options
      customIni = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          Custom etebase-server.ini.

          See <literal>etebase-src/etebase-server.ini.example</literal> for available options.

          Setting this option overrides the default config which is generated from the options
          <literal>secretFile</literal>, <literal>domain</literal> and <literal>database</literal>.
        '';
        example = literalExample ''
          [global]
          secret_file = /path/to/secret
          debug = false

          [allowed_hosts]
          allowed_host1 = example.com

          [database]
          engine = django.db.backends.sqlite3
          name = db.sqlite3
        '';
      };

      user = mkOption {
        type = types.str;
        default = defaultUser;
        description = "User under which Etebase server runs.";
      };

      package = mkOption {
        type = types.package;
        default = pkgs.etebase-server;
        defaultText = "pkgs.etebase-server";
        description = "The Etebase server package to use.";
      };
    };
  };

  config = mkIf cfg.enable {

    systemd.tmpfiles.rules = [
      "d '${cfg.dataDir}' - ${cfg.user} ${config.users.users.${cfg.user}.group} - -"
    ];

    systemd.services.etebase-server = {
      description = "An Etebase (EteSync 2.0) server";
      after = [ "network.target" "systemd-tmpfiles-setup.service" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        User = cfg.user;
        Restart = "always";
        WorkingDirectory = cfg.dataDir;
      };
      environment = {
        PYTHONPATH="${pythonEnv}/${pkgs.python3.sitePackages}";
        ETEBASE_EASY_CONFIG_PATH="${if cfg.customIni != null then cfg.customIni else configIni}";
      };
      preStart = ''
        # Auto-migrate on first run or if the package has changed
        versionFile="${cfg.dataDir}/src-version"
        if [[ $(cat "$versionFile" 2>/dev/null) != ${cfg.package} ]]; then
          ${pkgs.etebase-server}/bin/etebase-server migrate
          echo ${cfg.package} > "$versionFile"
        fi
      '';
      script =
        let
          networking = if cfg.unixSocket != null
          then "-u ${cfg.unixSocket}"
          else "-b ${cfg.host} -p ${toString cfg.port}";
        in ''
          cd "${pkgs.etebase-server}/lib/etebase-server";
          ${pkgs.python3Packages.daphne}/bin/daphne ${networking} \
            etebase_server.asgi:application
        '';
    };

    users = optionalAttrs (cfg.user == defaultUser) {
      users.${defaultUser} = {
        group = defaultUser;
        uid = config.ids.uids.etebase-server;
        home = cfg.dataDir;
      };

      groups.${defaultUser} = {
        gid = config.ids.gids.etebase-server;
      };
    };

    networking.firewall = mkIf cfg.openFirewall {
      allowedTCPPorts = [ cfg.port ];
    };
  };
}
