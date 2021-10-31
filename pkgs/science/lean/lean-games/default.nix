{ callPackage }:
{
  nng = callPackage ./nng.nix {};
  game-skeleton = callPackage ./game-skeleton.nix {};
  makeLeanGame = callPackage ./make-lean-game.nix {};
}
