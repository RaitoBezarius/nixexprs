{ lib
, fetchFromGitHub
, gettext
, yarn2nix-moretea
, python
}:
let
  # use it as a dependency of the Python package
  mkLeanClientInteractiveInterface = src:
  with yarn2nix-moretea;
  mkYarnPackage rec {
    pname = "lean-game-maker-client-interactive-interface";
    version = "v1.0.0";

    buildPhase = ''
      substituteInPlace deps/${pname}/src/interactive_interface/webpack.config.js \
      --replace "__dirname, 'node_modules'" "\"$(pwd)/node_modules\""
      ./node_modules/.bin/webpack \
        --config deps/${pname}/src/interactive_interface/webpack.config.js \
        --context deps/${pname}/src/interactive_interface \
        --mode=production
    '';

    installPhase = ''
      mv deps/${pname}/src/interactive_interface/dist $out
    '';

    distPhase = ''
      # Do nothing.
    '';

    inherit src;

    packageJSON = ./package.json;
    yarnLock = ./yarn.lock;
    yarnNix = ./yarn.nix;
  };
  pythonPkgs = with python.pkgs.pythonPackages; [
    regex
    jinja2
    mistletoe
    toml
    fire
    jsonpickle
    polib
  ];
  src = fetchFromGitHub {
    owner = "RaitoBezarius";
    repo = "Lean-game-maker";
    rev = "2664758f6d4782c08ae8fc22bdda9f9a9b1f9f69";
    sha256 = "1p268i95izjll594l3bjv5xm5ls2lspkvwizscp30dq3z7z7g72a";
  };
in
  with python.pkgs;
pythonPackages.buildPythonApplication rec {
  pname = "lean-game-maker";
  version = "2020-02-05"; # lack of versioning :/

  inherit src;

  preBuild = ''
    ln -s ${mkLeanClientInteractiveInterface src} src/interactive_interface/dist
  '';

  propagatedBuildInputs = pythonPkgs ++ [ gettext ];
  pythonEnv = python.withPackages (_: pythonPkgs);

  passthru = {
    inherit python pythonPkgs;
  };

  meta = {
    homepage = "https://github.com/mpedramfar/Lean-game-maker";
    description = "Lean game maker renders structured Lean files into an interactive web browser game using a JavaScript/WebAssembly implementation of the Lean server.";
    license = lib.licenses.asl20;
  };
}
