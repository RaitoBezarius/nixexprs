{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.domjudge;
  mkJudgeHost = k: {
    image = "domjudge/judgehost:latest";
    dependsOn = [ "domjudge-server" ];
    environment = {
      CONTAINER_TIMEZONE = cfg.timezone;
      DOMSERVER_BASEURL = "http://domjudge-server/";
      DAEMON_ID = k;
      JUDGEDAEMON_USERNAME = "judgehost";
      JUDGEDAEMON_PASSWORD = cfg.judgeDaemonPassword;
      DOMJUDGE_CREATE_WRITABLE_TEMP_DIR = "1";
    };
    volumes = [ "/sys/fs/cgroup:/sys/fs/cgroup:ro" ];
    extraOptions = [ "--privileged --network=${cfg.networkBridge}" ];
  };
  dockercli = "${config.virtualisation.docker.package}/bin/docker";
  domserverContainerName = "domjudge-server";
  domserver-script = pkgs.writeScriptBin "domserver" ''
        #!{pkgs.stdenv.shell}
        DOMSERVER=${domserverContainerName}
        ADMIN_PASSWORD_PATH="/opt/domjudge/domserver/etc/initial_admin_password.secret"
        REST_API_PATH="/opt/domjudge/domserver/etc/restapi.secret"
        SYMFONY_CONSOLE_PATH="/opt/domjudge/domserver/webapp/bin/console"

        function usage() {
          cat <<HEREDOC
          Usage: domserver command

          commands:
            print_admin_password    print the initial admin password
            print_rest_api_secret   print the REST API secret
            shell                   drop into bash shell in the container
            console                 Symfony console passthrough
            tail                    tail the latest logs

          optional arguments:
            -h, --help      show this help message and exit
    HEREDOC
        }

        function print_admin_password () {
          ${dockercli} exec -it $DOMSERVER cat $ADMIN_PASSWORD_PATH
        }

        function print_rest_api_secret () {
          ${dockercli} exec -it $DOMSERVER cat $REST_API_PATH
        }

        function shell () {
          ${dockercli} exec -it $DOMSERVER bash
        }

        function console () {
          ${dockercli} exec -it $DOMSERVER $SYMFONY_CONSOLE_PATH "$@"
        }

        function tail_logs () {
          ${dockercli} tail -f $DOMSERVER
        }

        while [ "$1" != "" ]; do
          PARAM=`echo $1 | awk -F= '{print $1}'`
          VALUE=`echo $1 | awk -F= '{print $2}'`
          case $PARAM in
              -h | --help)
                  usage
                  exit
                  ;;
              print_admin_password)
                  print_admin_password
                  exit
                  ;;
              print_rest_api_secret)
                  print_rest_api_secret
                  exit
                  ;;
              shell)
                  shell
                  exit
                  ;;
              console)
                  console "$@"
                  exit
                  ;;
              tail)
                  tail_logs
                  exit
                  ;;
              *)
                  echo "ERROR: unknown parameter \"$PARAM\""
                  usage
                  exit 1
                  ;;
          esac
          shift
        done

        usage
        exit
      '';

in {
  options.services.domjudge = {
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
    maxDBConnections = mkOption { type = types.int; default = 300; };
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
    judgeDaemonPassword = mkOption { type = types.str; };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [ domserver-script ];

    virtualisation.docker.enable = cfg.enable;

    virtualisation.oci-containers.containers = {
      "${domserverContainerName}" = {
        image = "domjudge/domserver:latest";
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
        image = "mariadb:10.5.8-focal";
        # cmd = [ "--max-connections ${toString cfg.maxDBConnections}"];
        environment = {
          MYSQL_ROOT_PASSWORD = cfg.rootDBPassword;
          MYSQL_USER = "domjudge";
          MYSQL_PASSWORD = cfg.dbPassword;
          MYSQL_DATABASE = "domjudge";
        };
        volumes = [ "${cfg.stateDir}/db:/var/lib/mysql" ];
        extraOptions = [ "--network=${cfg.networkBridge}" ];
      };
    } // listToAttrs (map (k: nameValuePair "judgehost-${k}" (mkJudgeHost k)) (map toString (range 1 cfg.judgeHostNumber)));

    systemd.services.init-domjudge-network = {
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
  };
}

