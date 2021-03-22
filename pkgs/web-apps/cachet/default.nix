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
    rev = "cfd173cf122d925b70d5133a37528db6120bea67";
    sha256 = "0bvs4ag0z2iwgmga2n7v465pazdi19m103hbpm1j3a73kylh01lw";
    fetchSubmodules = true;
  };
}
