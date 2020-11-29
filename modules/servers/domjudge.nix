{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.domjudge;
  mkJudgeHost = k: {
    name = "domjudge-host-${k}";
    value = {
      image = "domjudge/judgehost:latest";
      dependsOn = [ "domjudge-server" ];
      environment = {
        CONTAINER_TIMEZONE = cfg.timezone;
        DOMSERVER_BASEURL = "domjudge-server";
        DAEMON_ID = k;
        JUDGEDAEMON_USERNAME = cfg.judgeDaemon.username;
        JUDGEDAEMON_PASSWORD = cfg.judgeDaemon.password;
        DOMJUDGE_CREATE_WRITABLE_TEMP_DIR = "1";
      };
      volumes = [ "/sys/fs/cgroup:/sys/fs/cgroup:ro" ];
      extraOptions = [ "--privileged --network=${cfg.networkBridge}" ];
    };
  };

in {
  options.services.isso = {
    enable = mkEnableOption "Enable a Docker-based DOMjudge server";
    networkBridge = mkOption {
      type = types.str;
      default = "domjudge-br";
    };
    stateDir = mkOption {
      type = types.str;
      default = "/var/lib/domjudge";
    };
    dbPassword = mkOption { type = types.str; };
    rootDBPassword = mkOption { type = types.str; };
    timezone = mkOption {
      type = types.str;
      default = "Europe/Paris";
    };
    port = mkOption {
      type = types.port;
      default = 12345;
    };
  };
  config = {
    virtualisation.docker.enable = true;

    virtualisation.oci-containers.containers = {
      "domjudge-server" = {
        image = "domjudge/domjudge:latest";
        dependsOn = [ "domjudge-mariadb" ];
        environment = {
          CONTAINER_TIMEZONE = cfg.timezone;
          MYSQL_USER = "domjudge";
          MYSQL_HOST = "domjudge-mariadb";
          MYSQL_DATABASE = "domjudge";
          MYSQL_PASSWORD = cfg.dbPassword;
          MYSQL_ROOT_PASSWORD = cfg.rootDBPassword;
        };
        ports = [ "${toString cfg.port}:80" ];
        extraOptions = [ "--network=${cfg.networkBridge}" ];
      };

      "domjudge-mariadb" = {
        image = "mariadb/mariadb:latest";
        environment = {
          MYSQL_ROOT_PASSWORD = cfg.rootDBPassword;
          MYSQL_USER = "domjudge";
          MYSQL_PASSWORD = cfg.dbPassword;
          MYSQL_DATABASE = "domjudge";
        };
        volumes = [ "${cfg.stateDir}/db:/var/lib/mysql" ];
        extraOptions = [ "--network=${cfg.networkBridge}" ];
      };
    };

    systemd.services.init-domjudge-network = {
      description =
        "Create the network bridge ${cfg.networkBridge} for domjudge services.";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig.Type = "oneshot";
      script =
        let dockercli = "${config.virtualisation.docker.package}/bin/docker";
        in ''
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
  };
}

