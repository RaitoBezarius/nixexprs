{ lib, ... }:
with lib;
{
  options = {
    enable = mkEnableOption "Enable application with Next.js webserver";

    src = mkOption {
      description = "Source of the frontend application";
      type = types.either types.package types.path;
    };

    nextDir = mkOption {
      description = ''
        Next-built directory: result of `next build`
        Optional, as next build might uses network to perform SSG-related operations, prefer filesystem if possible or return empty paths in getStaticPaths.
        In that case, you will prefer to null this option and let it be done at pre-start.
        Restarts will be slower.
      '';
      type = types.nullOr (types.either types.package types.path);
    };

    nodeModules = mkOption {
      description = "node_modules derivation of the project, containing at least the `next` binary in node_modules/.bin";
      type = types.either types.package types.path;
    };

    port = mkOption {
      description = "Port on which `next` will run";
      type = types.port;
    };

    environment = mkOption {
      description = "Environment variables for the application";
      type = types.attrs;
      default = {
        NEXT_TELEMETRY_DISABLED = "1";
      };
    };
    # extraDirectives = mkOption {};
  };
}
