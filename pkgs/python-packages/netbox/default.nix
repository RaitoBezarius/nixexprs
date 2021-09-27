{ python, poetry2nix, fetchFromGitHub }:
let
  defaultConfiguration = ./default-configuration.py;
  mkNetboxApp = configuration:
  let app = (poetry2nix.mkPoetryApplication {
    inherit python;
    projectDir = ./.;
    src = fetchFromGitHub {
      owner = "RaitoBezarius";
      repo = "netbox";
      rev = "3c053f8e4beb5da4d02f2e7816ca1c304eb14281";
      sha256 = "sha256-y19fjj1+4FLWlBgSKkwMFhWrUT4dJJ/ytTtqpIajwg4=";
    };
    overrides = poetry2nix.overrides.withDefaults (self: super: {
      "ruamel-yaml" = python.pkgs.ruamel_yaml;
      "ruamel-yaml-clib" = python.pkgs.ruamel_yaml_clib;
    });
    preBuild = ''
      cp ${configuration} netbox/netbox/configuration.py
      echo netbox/netbox/configuration.py copied.
      #substituteInPlace ./netbox/netbox/settings.py \
      #  --replace "from netbox import configuration" "from netbox.netbox import configuration"
      #echo netbox/netbox/settings.py patched.
    '';
    preferWheels = true;
  });
  in
  app.python.buildEnv.override {
    extraLibs = [ app app.python.pkgs.django_environ ];
  };
in
  (mkNetboxApp defaultConfiguration) // { inherit mkNetboxApp; }
