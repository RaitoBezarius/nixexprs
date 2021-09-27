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
      rev = "7cbbe479404ffbacc8e4b0776e129c7a096dba04";
      sha256 = "sha256-yvLZK2S90LpTfE/oHr395CU89QUlmLOaJuOBaQuJX7Y=";
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
