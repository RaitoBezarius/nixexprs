{ lib, fetchFromGitHub, callPackage }:
let
  mergeMap = f: set: builtins.foldl' (x: acc: x // acc) {} (map (k: f k set.${k}) (builtins.attrNames set));
  leanReleases = lib.importJSON ./releases.json;
  processVersionName = ver: lib.removePrefix "v" (lib.replaceChars ["."] ["_"] ver);
  mkLeanRelease = version: releaseInfo: {
    ${processVersionName version} = callPackage ./generic.nix {
      inherit version;
      src = fetchFromGitHub {
        inherit (releaseInfo) owner repo rev sha256;
      };
    };
  };
  brokenReleases = ["v9.9.9" "we-love-bors" "v3.12.0" "v3.13.1"];
in
  mergeMap mkLeanRelease (lib.filterAttrs (name: _: !builtins.any (broken: name == broken) brokenReleases) leanReleases)
