{ callPackage, fetchFromGitHub, python }:
let
  src = fetchFromGitHub {
    owner = "RaitoBezarius";
    repo = "Lean-game-maker";
    rev = "9b225195f460fcceb9ab5cc8396488fb29d3fc31";
    sha256 = "sha256-qyvmh3AblaTpL2SaS236dd8SR9MobVu+Pbt/7PqB9h0=";
  };
  version = "2021-10-31";
in
{
  python = callPackage ./python.nix { inherit src version python; };
  web = callPackage ./web.nix { inherit src version; };
}
