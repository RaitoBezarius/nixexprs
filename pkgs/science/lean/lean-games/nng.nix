{ fetchFromGitHub, makeLeanGame }:
makeLeanGame {
  src = fetchFromGitHub {
    owner = "ImperialCollegeLondon";
    repo = "natural_number_game";
    rev = "e662e49ac977d4f0bbe53502e677e18025f9394c";
    sha256 = "0fy7i936akgy98zs2jk99q6d03dknh8fp0kkrla096flmhrlz67d";
  };
  gameConfig = {
    name = "Natural Number Game";
    version = "1.3.3";
  };
  leanpkgTOML = ./leanpkg-nng.toml;
  replaceLocalTOML = true; # override Lean version.
}
