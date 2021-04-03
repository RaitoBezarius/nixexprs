{ python, poetry2nix, fetchFromGitHub }:
(poetry2nix.mkPoetryApplication {
  inherit python;
  projectDir = ./.;
  src = fetchFromGitHub {
    owner = "RaitoBezarius";
    repo = "netbox";
    rev = "develop";
    sha256 = "05qjfx0aadcq7ffzliy0pqcb4j9jiq7cwl1jsp556dpy3ljbbxx1";
  };
  overrides = poetry2nix.overrides.withDefaults (self: super: {
    "ruamel-yaml" = python.pkgs.ruamel_yaml;
    "ruamel-yaml-clib" = python.pkgs.ruamel_yaml_clib;
  });
  preferWheels = true;
}).dependencyEnv
