{ fetchgit, rustPlatform, perl, pkgconfig, openssl, python3, callPackage }:
let
  # milksnake = callPackage ./milksnake.nix {};
  mkRelayPackage = { src, version }:
  rustPlatform.buildRustPackage rec {
    pname = "sentry-relay";
    inherit version;
    cargoSha256 = "sha256-LmBw7vmlwhQD3QTbcjXE8Y5m2V2OCOyUN3PjS5BRjzQ=";
    buildInputs = [ pkgconfig openssl ];
    nativeBuildInputs = [ perl ];

    passthru.pythonPackage = python3.pkgs.buildPythonPackage {
      inherit pname version src;
      sourceRoot = "${src}/py";
      doCheck = false;
      buildInputs = with rustPlatform.rust; [ cargo rustc ];
    };

    inherit src;
  };
in
  mkRelayPackage
  (rec {
    version = "21.9.0";
    src = fetchgit {
      url = "https://github.com/getsentry/relay";
      rev = version;
      sha256 = "sha256-/tfVR0ueWzWZoz/xKYmi4+jtaATGcvHjZSaY+9QK9u8=";
      fetchSubmodules = true;
    };
  })

