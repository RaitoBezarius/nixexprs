{ callPackage }:
{
  nng = callPackage ./nng.nix {};
  game-skeleton = callPackage ./game-skeleton.nix {};
}
