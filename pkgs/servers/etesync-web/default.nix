{ stdenv, fetchurl, yarn2nix-moretea }:
with yarn2nix-moretea;
let
  mkEteSyncClient = customAPI:
  mkYarnPackage rec {
    pname = "etesync-web";
    version = "v0.5.1";

    # yarnFlags = defaultYarnFlags ++ [ "--production=yes"];

    buildPhase = ''
      yarn build --offline
    '';

    installPhase = ''
      mv deps/${pname}/build $out
    '';

    distPhase = ''
      # Do nothing.
    '';

    src = fetchurl {
      url = "https://github.com/etesync/etesync-web/archive/${version}.tar.gz";
      sha256 = "0j07m6hy6mvjk68ysg9z83lksn8sm6dbv7l1blk39rp4ks6kybzp";
    };

    passthru = {
      withCustomAPI = mkEteSyncClient;
    };

    REACT_APP_DEFAULT_API_PATH = customAPI;
    packageJSON = ./package.json;
    yarnLock = ./yarn.lock;
    yarnNix = ./yarn.nix;
  };
in
(mkEteSyncClient "etesync.com")
