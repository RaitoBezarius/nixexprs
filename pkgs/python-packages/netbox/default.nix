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
      rev = "3f97d1436fda6dc8a3e2f6e19f07265801e38987";
      sha256 = "sha256-c2z5VOi/BDQlHGTVmpnLuHG0WnDvVECsDx7c+pzvTjg=";
    };
    overrides = poetry2nix.overrides.withDefaults (self: super: {
      "ruamel-yaml" = python.pkgs.ruamel_yaml;
      "ruamel-yaml-clib" = python.pkgs.ruamel_yaml_clib;
      "pygments" = python.pkgs.pygments;
      "zipp" = python.pkgs.zipp;
      "six" = python.pkgs.six;
      "more-itertools" = python.pkgs.more-itertools;
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
