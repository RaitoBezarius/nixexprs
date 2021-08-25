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
  brokenReleases = [
    "v9.9.9"
    "we-love-bors"
    "v3.12.0"
    "v3.13.0"
    "v3.13.1"
    "v3.13.2"
    "v3.14.0"
    "v3.15.0"
    "v3.16.2"
    "v3.10.0"
    "v3.16.0"
    "v3.16.1"
    "v3.5.1"
    "v3.11.0"
    "v3.6.0"
  ];
in
  mergeMap mkLeanRelease (lib.filterAttrs (name: _: !builtins.any (broken: name == broken) brokenReleases) leanReleases)
