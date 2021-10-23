{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.services.invoiceplane;
in
  {
    options.services.invoiceplane = {
      enable = mkEnableOption "InvoicePlane, an open source invoice system";
      package = mkOption {
        type = types.package;
        default = pkgs.fetchurl {
          name = "invoiceplane-v1.5.11";
          url = "https://github.com/InvoicePlane/InvoicePlane/releases/download/v1.5.11/v1.5.11.zip";
          sha256 = "1vljj3d2v6vlw034fp8fn4a0524839234n9rspjd622fz3sz6kc5";
        };
      };
      phpPackage = mkOption {
        type = types.package;
        default = pkgs.php74;
        defaultText = "pkgs.php74";
      };
      dataDir = mkOption {
        type = types.path;
        default = "/var/lib/invoiceplane";
      };
      hostName = mkOption {
        type = types.str;
      };
    };

    config = mkIf cfg.enable {
      systemd.services.invoiceplane-presetup = {
        wantedBy = ["multi-user.target"];
        after = [ "mysql.service" ];
        serviceConfig.Type = "oneshot";
        script = ''
          mkdir -p ${cfg.dataDir}/invoiceplane-home

          ${pkgs.rsync}/bin/rsync -aI ${cfg.package} ${cfg.dataDir}/invoiceplane-home
          [ ! -f ${cfg.dataDir}/ipconfig_created ] && ${pkgs.rsync}/bin/rsync -aI ${cfg.package}/ipconfig.php.example ${cfg.dataDir}/invoiceplane-home/ipconfig.php && touch ${cfg.dataDir}/ipconfig_created

          sed -i "s/IP_URL=/IP_URL=http://${cfg.hostName}" ${cfg.dataDir}/invoiceplane-home/ipconfig.php
          chown -R nginx:nginx ${cfg.dataDir}/invoiceplane-home
          chmod -R u+w ${cfg.dataDir}/invoiceplane-home
        '';
      };

      services.mysql = {
        enable = true;
        package = pkgs.mariadb;
        # TODO: create database.
      };

      services.nginx = {
        enable = true;
        virtualHosts."${cfg.hostName}" = {
          root = "${cfg.dataDir}/invoiceplane-home";
          locations = {
            "/".extraConfig = ''
              try_files $uri /index.php$is_args$args;
            '';

            "~ \.php$".extraConfig = ''
              include ${config.services.nginx.package}/conf/fscgi_params;
              fastcgi_pass unix:${config.services.phpfpm.pools.invoiceplane.socket};
              fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
              fastcgi_index index.php;
              fastcgi_keep_conn on;
            '';
          };
        };
      };

      services.phpfpm.pools.invoiceplane = {
        user = "nginx";
        group = "nginx";
        settings = {
          "listener.owner" = "nginx";
          "listener.group" = "nginx";
          "listen.mode" = "0600";
          "pm" = "dynamic";
          "pm.max_children" = "4";
          "pm.start_servers" = "1";
          "pm.min_spare_servers" = "1";
          "pm.max_spare_servers" = "2";
          "pm.max_requests" = "0";
        };
        inherit (cfg) phpPackage;
      };
    };
  }
