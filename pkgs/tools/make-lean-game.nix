{ lib, git, remarshal, lean, writeText, runCommand, lean-game-maker, stdenvNoCC }:
{ src, gameConfig, replaceLocalTOML ? false, leanpkgTOML ? ./leanpkg.toml, noLibrary ? false, development ? false, locale ? "en" }:
let
  writeJSON = config: writeText "config.json" (builtins.toJSON config);
  writeTOML = config: runCommand "config.toml" {} ''
    ${remarshal}/bin/json2toml < ${writeJSON config} > $out
  '';
  gameConfigFile = writeTOML gameConfig;
  leanpkgConfig = (builtins.fromTOML (builtins.readFile leanpkgTOML));
  leanpkgDependencies = leanpkgConfig.dependencies;
  # Symbolic link the source to _target/deps/${name}
  mkAdhocDependency = name: dep:
  let
    src = builtins.fetchGit {
      url = dep.git;
      ref = "master";
      inherit (dep) rev;
      # leaveDotGit = true;
    };
  in
    "ln -s ${src} _target/deps/${name}";

  leanpkgPath = writeText "leanpkg.path" ''
    builtin_path
    ${lib.concatStringsSep "\n" (lib.mapAttrsToList (name: _: "path _target/deps/${name}/src") leanpkgDependencies)}
    path ./src
  '';
  gameName = gameConfig.name or leanpkgConfig.name;
  # assert that gameConfig.name must be not null!
in
stdenvNoCC.mkDerivation {
  pname = "lean-game-${lib.strings.sanitizeDerivationName gameConfig.name}";
  inherit (gameConfig) version;

  buildInputs = [ lean-game-maker lean git ];

  buildPhase = ''
    mkdir -p _target/deps
    ${lib.concatStringsSep "\n" (lib.mapAttrsToList mkAdhocDependency leanpkgDependencies)}
    ln -s ${leanpkgPath} leanpkg.path
    ${if replaceLocalTOML then ''
      cp ${leanpkgTOML} leanpkg.toml
    '' else ""}
    [ ! -f "./game_config.toml" ] && ln -s ${gameConfigFile} game_config.toml
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
