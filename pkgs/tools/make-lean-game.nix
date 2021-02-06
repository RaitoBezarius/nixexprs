{ lib, remarshal, lean, writeText, runCommand, lean-game-maker, stdenvNoCC }:
{ src, gameConfig, noLibrary ? false, development ? false, locale ? "en" }:
let
  writeJSON = config: writeText "config.json" (builtins.toJSON config);
  writeTOML = config: runCommand "config.toml" {} ''
    ${remarshal}/bin/json2toml < ${writeJSON config} > $out
  '';
  gameConfigFile = writeTOML gameConfig;
  # assert that gameConfig.name must be not null!
in
stdenvNoCC.mkDerivation {
  pname = "lean-game-${lib.strings.sanitizeDerivationName gameConfig.name}";
  inherit (gameConfig) version;

  buildInputs = [ lean-game-maker lean ];

  buildPhase = ''
    [ ! f "./game_config.toml" ] && ln -s ${gameConfigFile} game_config.toml
    make-lean-game \
      --outdir $out \
      --locale ${locale} \
      --devmode=${toString development} \
      --nolib=${toString noLibrary}
  '';

  installPhase = ''
    # Do nothing.
  '';

  inherit src;
}
