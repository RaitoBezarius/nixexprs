{ pkgs ? import <nixpkgs> {} }:
let myPkgs = pkgs.callPackage ./default.nix {};
in
  with myPkgs; [
    myNixops
    beauties
    cachet
    wireguard-vanity-address
    workingEmscripten
    kachpass
    trinitycore
  ]
