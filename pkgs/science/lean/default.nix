{ lib, fetchFromGitHub, callPackage, emscripten, npmlock2nix }:
let
  mergeMap = f: set: builtins.foldl' (x: acc: x // acc) {} (map (k: f k set.${k}) (builtins.attrNames set));
  leanReleases = lib.importJSON ./releases.json;
  processVersionName = ver: lib.removePrefix "v" (lib.replaceChars ["."] ["_"] ver);
  mkLeanRelease = version: releaseInfo: {
    ${processVersionName version} = callPackage ./generic.nix {
      inherit version emscripten npmlock2nix;
      leanUtils = callPackage ./utils.nix {};
      src = fetchFromGitHub {
        inherit (releaseInfo) owner repo rev sha256;
      };
    };
  };
  brokenReleases = [
    "v9.9.9"
    "we-love-bors"
  ];
  minimalVersion = "v3.24.0";
  isBrokenRelease = v: builtins.any (broken: v == broken) brokenReleases;
  isAcceptableVersion = v: lib.versionAtLeast v minimalVersion;
in
  mergeMap mkLeanRelease (lib.filterAttrs (name: _: !isBrokenRelease name && isAcceptableVersion name) leanReleases)
