{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.domjudge;
  mkJudgeHost = k: {
    image = "domjudge/judgehost:latest";
    dependsOn = [ "domjudge-server" ];
    environmentFiles = [ cfg.judgeDaemonPasswordFile ];
    environment = {
      CONTAINER_TIMEZONE = cfg.timezone;
      DOMSERVER_BASEURL = "http://domjudge-server/";
      DAEMON_ID = k;
      JUDGEDAEMON_USERNAME = "judgehost";
      DOMJUDGE_CREATE_WRITABLE_TEMP_DIR = "1";
    };
    volumes = [ "/sys/fs/cgroup:/sys/fs/cgroup:ro" ];
    extraOptions =
      [ "--privileged" "--network=${cfg.networkBridge}" "--hostname=judge" ];
  };
in {
  options.services.domjudge = {
    enable = mkEnableOption "Enable a Docker-based DOMjudge server";
    containerName = mkOption {
      type = types.str;
      default = "domjudge-server";
    };
    networkBridge = mkOption {
      type = types.str;
      default = "domjudge-br";
    };
    stateDir = mkOption {
      type = types.str;
      default = "/var/lib/domjudge";
    };
    databaseEnvironmentFile = mkOption {
      type = types.path;
      description = ''
        A file containing secrets environment variables.
        Must contain: MYSQL_PASSWORD, MYSQL_ROOT_PASSWORD.
      '';
    };
    judgeDaemonPasswordFile = mkOption {
      type = types.path;
      description = ''
        Must contain: JUDGEDAEMON_PASSWORD=<password>.
      '';
    };
    maxDBConnections = mkOption {
      type = types.int;
      default = 300;
    };
    timezone = mkOption {
      type = types.str;
      default = "Europe/Paris";
    };
    port = mkOption {
      type = types.port;
      default = 12345;
    };
    judgeHostNumber = mkOption {
      type = types.int;
      default = 1;
    };
  };
  config = mkIf cfg.enable {
    virtualisation.docker.enable = cfg.enable;
    virtualisation.oci-containers.containers = {
      "${cfg.containerName}" = {
        image = "domjudge/domserver:latest";
        dependsOn = [ "domjudge-mariadb" ];
        environmentFiles = [ cfg.databaseEnvironmentFile ];
        environment = {
          CONTAINER_TIMEZONE = cfg.timezone;
          MYSQL_USER = "domjudge";
          MYSQL_HOST = "domjudge-mariadb";
          MYSQL_DATABASE = "domjudge";
        };
        ports = [ "${toString cfg.port}:80" ];
        extraOptions = [ "--network=${cfg.networkBridge}" ];
      };

      "domjudge-mariadb" = {
        image = "mariadb:10.5.8-focal";
        environmentFiles = [ cfg.databaseEnvironmentFile ];
        # cmd = [ "--max-connections ${toString cfg.maxDBConnections}"];
        environment = {
          MYSQL_USER = "domjudge";
          MYSQL_DATABASE = "domjudge";
        };
        volumes = [ "${cfg.stateDir}/db:/var/lib/mysql" ];
        extraOptions = [ "--network=${cfg.networkBridge}" ];
      };
    } // listToAttrs (map (k: nameValuePair "judgehost-${k}" (mkJudgeHost k))
      (map toString (range 1 cfg.judgeHostNumber)));

    systemd.services = mkMerge [
      # Delegate cgroups.
      (lib.listToAttrs
        (map (name: {
          inherit name;
          value = { serviceConfig.Delegate = "yes"; };
        }) (map (k: "judgehost-${toString k}") (range 1 cfg.judgeHostNumber)))
      )
      ({
        init-domjudge-network = {
          description =
            "Create the network bridge ${cfg.networkBridge} for domjudge services.";
          after = [ "network.target" ];
          wantedBy = [ "multi-user.target" ];

          serviceConfig.Type = "oneshot";
          script = ''
            # Put a true at the end to prevent getting non-zero return code, which will
            # crash the whole service.
            check=$(${dockercli} network ls | grep "${cfg.networkBridge}" || true)
            if [ -z "$check" ]; then
              ${dockercli} network create ${cfg.networkBridge}
            else
              echo "${cfg.networkBridge} already exists in docker"
            fi
          '';
        };
      })
    ];
  };
}
