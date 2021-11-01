{ lib, writeTOML, lean-game-maker, stdenvNoCC }:
{ src, gameName, gameConfig, leanpkgConfig, development ? false, locale ? "en", ... }:
let
  gameConfigFile = writeTOML gameConfig;
in
assert gameName != null;
stdenvNoCC.mkDerivation {
  pname = "${lib.strings.sanitizeDerivationName gameConfig.name}-lean-game-data";
  inherit (gameConfig) version;

  buildInputs = [ lean-game-maker.python ];

  phases = [ "unpackPhase" "buildPhase" ];

  buildPhase = ''
    [ ! -f "./game_config.toml" ] && ln -s ${gameConfigFile} game_config.toml
    make-lean-game \
      --outdir $out \
      --locale ${locale} \
      --devmode=${toString development}
  '';

  inherit src;
}
