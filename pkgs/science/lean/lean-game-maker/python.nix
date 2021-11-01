{ lib
, gettext
, python
, src
, version
}:
let
  pythonPkgs = with python.pkgs.pythonPackages; [
    regex
    jinja2
    mistletoe
    toml
    fire
    jsonpickle
    polib
  ];
in
with python.pkgs;
pythonPackages.buildPythonApplication rec {
  pname = "lean-game-maker";
  inherit version;

  inherit src;

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
