{ lib, name, config, ... }:
with lib;
{
  enable = mkEnableOption "Enable ${name} application with Next.js webserver";

  src = mkOption {
    description = "Source of the frontend application";
  };

  nextDir = mkOption {
    description = "Next-built directory: result of `next build`";
    type = types.str;
  };

  nodeModules = mkOption {
    description = "node_modules derivation of the project, containing at least the `next` binary in node_modules/.bin";
    type = types.str;
  };

  port = mkOption {
    description = "Port on which `next` will run";
    type = types.port;
  };

  environment = mkOption {
    description = "Environment variables for the application";
    type = types.attrs;
    default = {
      NEXT_TELEMETRY_DISABLED = 1;
    };
  };

  # extraDirectives = mkOption {};
}
