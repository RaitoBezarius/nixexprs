{ config, pkgs, ... }:
let
  cfg = config.services.domjudge;
  dockercli = "${config.virtualisation.docker.package}/bin/docker";
  domserver-script = pkgs.writeScriptBin "domserver" ''
        #!{pkgs.stdenv.shell}
        DOMSERVER=${cfg.containerName}
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
in
{
  environment.systemPackages = mkIf cfg.enable [ domserver-script ];
}
