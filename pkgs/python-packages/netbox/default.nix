{ python, poetry2nix, fetchFromGitHub, lib }:
let
  defaultConfiguration = ./default-configuration.py;
  mkNetboxApp = { configuration, plugins ? [] }:
  let
    prettyPluginList = lib.concatStringsSep "," (map (p: p.pname) plugins);
    pluginList = "[${lib.concatStringsSep ", " (map (p: "'${p.pname}'") plugins)}]";
    app = (poetry2nix.mkPoetryApplication {
      inherit python;
      projectDir = ./.;
      src = fetchFromGitHub {
        owner = "RaitoBezarius";
        repo = "netbox";
        rev = "85b69b89e3688309f57cb6bc87d34dc4ab90b8d3";
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
        echo netbox/netbox/configuration.py copied, installing plugins...
        ${if builtins.length plugins > 0 then ''
          substituteInPlace netbox/netbox/configuration.py \
          --replace "@nixPlugins@" "${pluginList}"
          echo plugins (${prettyPluginList}) installed.
        '' else ''
          echo no plugin to install.
        ''}
      '';
      postInstall = ''
        ln -s $out/lib/python3.9/site-packages/netbox/utilities/templates $out/lib/python3.9/site-packages/utilities/templates
        echo netbox utilities templates fixed up.
      '';
      preferWheels = true;
  });
  in
  app.python.buildEnv.override {
    extraLibs = [ app app.python.pkgs.django_environ ] ++ plugins;
  };
in
  (mkNetboxApp { configuration = defaultConfiguration; }) // { inherit mkNetboxApp; }
