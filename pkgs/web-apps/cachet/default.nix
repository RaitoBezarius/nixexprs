{pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem, noDev ? true}:

let
  composerEnv = import ./composer-env.nix {
    inherit (pkgs) stdenv lib writeTextFile fetchurl php unzip phpPackages;
  };
in
import ./php-packages.nix {
  inherit composerEnv noDev;
  inherit (pkgs) fetchurl fetchgit fetchhg fetchsvn;
  src = pkgs.fetchFromGitHub {
    owner = "cachethq";
    repo = "cachet";
    rev = "cf86f65f1dabf283d001d0f5d380f26dd5cfb64c";
    sha256 = "sha256-Hh5lStMBrIo6EYHJ7sXnbyRO783Z1Z/jxxie839Js8g=";
    fetchSubmodules = true;
  };
}
