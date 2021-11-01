{ fetchFromGitHub, makeLeanGame }:
makeLeanGame {
  src = fetchFromGitHub {
    owner = "kbuzzard";
    repo = "lean-game-skeleton";
    rev = "098454dd6acc4c06beccf52b6547bf4cd99cc581";
    sha256 = "1ppzflpy27avi2r8r1g2lnxww4nakf6ipa046znag1hgzaknqrrg";
  };
  gameConfig = {
    name = "Game Skeleton";
    version = "1.3.3";
  };
  leanpkgTOML = ./leanpkg-game-skeleton.toml;
  replaceLocalTOML = true; # override Lean version.
}
