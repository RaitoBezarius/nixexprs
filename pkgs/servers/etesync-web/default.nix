{ stdenv, fetchurl, yarn2nix-moretea }:
with yarn2nix-moretea;
let
  mkEteSyncClient = customAPI:
  mkYarnPackage rec {
    pname = "etesync-web";
    version = "v0.6.1";

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
      sha256 = "0ggvsr7d576mfnimwnssp8q7caqgyyj700j6wfmaa0xd3d9jhvmm";
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
