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
    rev = "b64f2d5ed7c2da66c42ea9cee98a591c82c9c025";
    sha256 = "0arvcg3kcf9qballyqx9j1ibnq450a6fs5ysf2vjl89f95yd65ck";
  };
in
  with python.pkgs;
pythonPackages.buildPythonApplication rec {
  pname = "lean-game-maker";
  version = "2020-02-07"; # lack of versioning :/

  inherit src;

  preBuild =
  let
    interactiveInterfaceFiles = mkLeanClientInteractiveInterface src;
  in
  ''
    ln -s ${interactiveInterfaceFiles} src/interactive_interface/dist
    echo "src/interactive_interface/dist → ${interactiveInterfaceFiles}"
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
