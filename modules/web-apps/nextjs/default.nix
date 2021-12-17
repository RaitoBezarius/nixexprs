{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.services.nextjs;
  enabledApplications = filterAttrs (n: v: v.enable) cfg;
  mkAppUnit = name: subcfg: nameValuePair "nextjs-${name}" {
    description = "Next.js runtime for ${name} application";
    after = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    preStart = ''
      cp -r ${subcfg.nextDir} .next
      cp -r ${subcfg.src} app
    '';

    serviceConfig = {
      DynamicUser = true;
      ExecStart = "${subcfg.nodeModules}/.bin/next start app -p ${toString subcfg.port}";
      Restart = "on-failure";
      RestartSec = "30s";
      PrivateTmp = true;
      StateDirectory = "nextjs-${name}";
    };

    inherit (subcfg) environment;
  };
in
{
  options.services.nextjs = mkOption {
    default = {};
    type = types.attrsOf (types.submodule (import ./app-options.nix));
    description = ''
      List of Next.js web applications to run.
    '';
  };

  config = {
    systemd.services = mapAttrs' mkAppUnit enabledApplications;
  };
}
