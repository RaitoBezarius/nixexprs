{ config, lib, ... }:
with lib;
let
  cfg = config.services.lean-games;
  virtualHostOpts = {
    options = {
      enableACME = mkOption {
        description = "Use Let's Encrypt and force SSL.";
        default = true;
        type = types.bool;
      };
      package = mkOption {
        description = "Lean game package source";
        example = "pkgs.lean-games.nng";
        type = types.package;
      };
    };
  };
in
  {
    options.services.lean-games = {
      enable = mkEnableOption "Enable the Lean game service";

      virtualHosts = mkOption {
        type = types.attrsOf (types.submodule virtualHostOpts);
      };
    };

    config = mkIf cfg.enable {
      services.nginx.virtualHosts = mapAttrs' (name: value: {
        {
          root = value.package;
          enableACME = value.enableACME;
          forceSSL = value.enableACME;
        }
      }) cfg.virtualHosts;
    }
  }
