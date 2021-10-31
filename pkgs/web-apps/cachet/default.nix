{pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem, noDev ? true}:

let
  composerEnv = import ./composer-env.nix {
    inherit (pkgs) stdenv lib writeTextFile fetchurl unzip;
    php = pkgs.php74;
    phpPackages = pkgs.php74Packages;
  };
in
import ./php-packages.nix {
  inherit composerEnv noDev;
  inherit (pkgs) fetchurl fetchgit fetchhg fetchsvn;
  src = pkgs.fetchFromGitHub {
    owner = "fiveai";
    repo = "cachet";
    rev = "0fbeaa1b5649361ffe64ab9a9d960eccd10186ef";
    sha256 = "sha256-kmxDFIbsRdDKPBkmTozcWU8vPfpjnQV7q4UJkTL76ZA=";
    fetchSubmodules = true;
  };
}
