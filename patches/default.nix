{ pkgs }:
let
  # self is not included here to avoid recursion.
  callPackage = pkgs.lib.callPackageWith pkgs;
  self = rec {
  };
in
self
