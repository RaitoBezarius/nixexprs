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
      ${pkgs.rsync}/bin/rsync -aI --delete ${subcfg.src}/ /var/lib/nextjs/${name}/app
      ${pkgs.rsync}/bin/rsync -aI --delete ${subcfg.nodeModules}/ /var/lib/nextjs/${name}/app/node_modules
          ${if subcfg.nextDir == null then ''
            export NODE_PATH=/var/lib/nextjs/${name}/app/node_modules:$NODE_PATH
            chmod -R u+rw /var/lib/nextjs/${name}/app
            cd /var/lib/nextjs/${name}/app
            ./node_modules/bin/next build
        '' else ''
          ${pkgs.rsync}/bin/rsync -aI --delete ${subcfg.nextDir}/ /var/lib/nextjs/${name}/app/.next
          chmod -R u+rw /var/lib/nextjs/${name}/app
      ''}
    '';

    serviceConfig = {
      DynamicUser = true;
      WorkingDirectory = "/var/lib/nextjs/${name}";
      ExecStart = "${subcfg.nodeModules}/bin/next start app -p ${toString subcfg.port}";
      Restart = "on-failure";
      RestartSec = "30s";
      PrivateTmp = true;
      StateDirectory = "nextjs/${name}";
    };

    environment = {
      NODE_PATH = "${subcfg.nodeModules}/node_modules";
    } // subcfg.environment;
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
