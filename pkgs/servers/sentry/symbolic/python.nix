{ milksnake, python3, fetchFromGitHub, rust-symbolic }:
let
  source = import ./source.nix { inherit fetchFromGitHub; };
in
  python3.pkgs.buildPythonPackage rec {
    pname = "symbolic";
    inherit (source) version src;

    sourceRoot = "py";
    nativeBuildInputs = [ milksnake rust-symbolic ];
  }
