{ config, lib, pkgs, ... }:
# TODO: settings.
with lib;
let
  cfg = config.services.netbox;
  python = cfg.package.python;
  dbOpts = {
    options = {
      name = mkOption {
        type = types.str;
        default = cfg.user;
      };
    };
  };
  gunicornOpts = {
    options = {
      bind = mkOption {
        type = types.str;
        default = "${cfg.gunicorn.host}:${toString cfg.gunicorn.port}";
      };
      host = mkOption {
        type = types.str;
        default = "127.0.0.1";
      };
      port = mkOption {
        type = types.port;
        default = 8000;
      };

      workers = mkOption {
        type = types.integer;
        default = 5; # 2n + 1 cores.
      };
      threads = mkOption {
        type = types.integer;
        default = 3;
      };
      timeout = mkOption {
        type = types.integer;
        default = 120;
      };
      maxRequests = mkOption {
        type = types.integer;
        default = 5000;
      };
      maxRequestsJitter = mkOption {
        type = types.integer;
        default = 500;
      };
    };
  };
  redisOpts = {
    options = {
      queueDatabase = mkOption {
        type = types.integer;
        default = 0;
      };
      cachingDatabase = mkOption {
        type = types.integer;
        default = 1;
      };
    };
  };
  nbRedisDatabases = if cfg.redis.queueDatabase <= cfg.redis.cachingDatabase then cfg.redis.cachingDatabase else cfg.redis.queueDatabase;
in
  {
    options.services.netbox = {
      enable = mkEnableOption "Enable the Netbox service";
      # TODO: patch netbox/netbox/settings.py on MEDIA_* and STATIC_* to ensure that it gets configured like others.
      package = mkOption {
        type = types.package;
        defaultText = "pkgs.netbox";
        default = pkgs.netbox;
      };
      user = mkOption {
        type = types.str;
        default = "netbox";
      };
      group = mkOption {
        type = types.str;
        default = "netbox";
      };
      database = mkOption {
        type = types.submodule dbOpts;
      };
      gunicorn = mkOption {
        type = types.submodule gunicornOpts;
      };
      redis = mkOption {
        type = types.submodule redisOpts;
      };
    };

    config = mkIf cfg.enable {
      # TODO: If actual config has less than required Redis database, fail?
      #

      # 0. Manage script.
      environment.systemPackages = with pkgs; [
        (writeScriptBin "netbox-manage" ''
          #!${stdenv.shell}
        '')
      ];

      # 1. PostgreSQL.
      services.postgresql = {
        enable = true;
        ensureUsers = [
          {
            name = cfg.user;
            ensurePermissions = {
              "DATABASE ${cfg.database.name}" = "ALL PRIVILEGES";
            };
          }
        ];
        ensureDatabases = [ cfg.database.name ];
      };

      # 2. Redis.
      services.redis.enable = true;
      services.redis.databases = lib.mkDefault nbRedisDatabases; # Ensure at least N successive databases with N = max(caching_i, worker_i)

      # 3. Gunicorn
      systemd.services.netbox-rq-worker = {
        description = "Netbox request queue worker";
        after = [ "network-online.target" ];

        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
          User = cfg.user;
          Group = cfg.group;
          ExecStart = "netbox-manage rqworker";

          Restart = "on-failure";
          RestartSec = "30s";

          PrivateTmp = true;
        };
      };

      systemd.services.netbox-server = {
        description = "Netbox WSGI service";
        after = [ "network-online.target" "systemd-tmpfiles-setup.service" ];
        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
          User = cfg.user;
          Group = cfg.group;
          Restart = "on-failure";
          PrivateTmp = true;
          RestartSec = "30s";
          StartLimitIntervalSec = "30s";
          ExecStart = ''${python.pkgs.gunicorn}/bin/gunicorn \
            -w ${toString cfg.gunicorn.workers} \
            -t ${toString cfg.gunicorn.threads} \
            --timeout ${toString cfg.gunicorn.timeout} \
            --max-requests ${toString cfg.gunicorn.maxRequests} \
            --max-requests-jitter ${toString cfg.gunicorn.maxRequestsJitter} \
            --bind ${toString cfg.gunicorn.bind} \
            entrypoint_wsgi
          '';
        };

        environment = {
          PYTHONPATH = "${cfg.pythonEnv}/${python.sitePackages}";
          DJANGO_CONFIGURATION = "blablabla";
        };

        preStart = ''
          # Auto-migrate
          # Trace paths
          # Remove stale content
          # Clear sessions
          # Invalidate cache
        '';
      };
    };
  }
