{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.boot.mandos;
in
{
  options = {
    boot.mandos = {
      enable = mkEnableOption "Mandos";

      usePlymouth = mkEnableOption "Mandos for Plymouth";
      useUsplash = mkEnableOption "Mandos for Usplash";
      useSplashy = mkEnableOption "Mandos for Splashy";
      useAskpassFifo = mkEnableOption "Mandos for askpass-fifo";
      usePasswordPrompt = mkEnableOption "Password prompt for Mandos";

      package = mkOption {
        default = pkgs.mandos-client;
        defaultText = "pkgs.mandos-client";
        description = "Package to use with Mandos";
      };
      keys = mkOption {
        default = "/etc/mandos/keys";
        type = types.str;
        description = ''
          Directory where the TLS/GnuPG keys are.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    users.users._mandos = {};
    # Force-add net & force-load ipv6.
    # Require an initrd.
    security.wrappers = []; # make all the plugins SUID bit.
    boot.initrd.enable = true;

    boot.initrd.preDeviceCommands = ''
    '';

    boot.initrd.postDeviceCommands = ''
      pid=$(cat /run/mandos-plugin-runner.pid 2>/dev/null)

      # If the dummy plugin is running, removing this file should force the
      # dummy plugin to exit successfully, thereby making plugin-runner shut
      # down all its other plugins and then exit itself.
      rm -f /run/mandos-keep-running >/dev/null 2>&1

      # Wait for exit of plugin-runner, if still running
      if [ -n "$pid" ]; then
          while :; do
              case "$(readlink /proc/"$pid"/exe 2>/dev/null)" in
                  */plugin-runner) sleep 1;;
                  *) break;;
              esac
          done
          rm -f /run/mandos-plugin-runner.pid >/dev/null 2>&1
      fi
    '';

    boot.initrd.extraUtilsCommands = ''
      # Copy library dir.
      # Copy key dir.

      for file in ${cfg.package}/lib; do
        copy_bin_and_libs "$file"
      copy_bin_and_libs

      # Copy GPGME & GPG.
      #

    '';
  };
}
