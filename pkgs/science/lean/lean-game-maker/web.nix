{ lib
, gettext
, yarn2nix-moretea
, python
, src
, version
}:
with yarn2nix-moretea;
mkYarnPackage rec {
  pname = "lean-game-maker-web-client";
  inherit version;

  NODE_OPTIONS = "--openssl-legacy-provider";

  buildPhase = ''
    ls deps/
    substituteInPlace deps/${pname}/src/interactive_interface/webpack.config.js \
    --replace "__dirname, 'node_modules'" "\"$(pwd)/node_modules\""
    ./node_modules/.bin/webpack \
      --config deps/${pname}/src/interactive_interface/webpack.config.js \
      --context deps/${pname}/src/interactive_interface \
      --mode=production
  '';

  installPhase = ''
    mv deps/${pname}/src/interactive_interface/dist $out
  '';

  distPhase = ''
    # Do nothing.
  '';

  inherit src;

  packageJSON = ./package.json;
  yarnLock = ./yarn.lock;
  yarnNix = ./yarn.nix;
}
