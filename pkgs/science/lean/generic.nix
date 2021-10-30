{ lib, stdenv, fetchFromGitHub, cmake, gmp, coreutils, callPackage, version, src
, buildEmscriptenPackage, emscripten, leanUtils }:
let
  drv = stdenv.mkDerivation rec {
    pname = "lean";
    inherit version src;
    nativeBuildInputs = [ cmake ];
    buildInputs = [ gmp ];

    cmakeDir = "../src";

    # Running the tests is required to build the *.olean files for the core
    # library.
    doCheck = true;

    postPatch = "patchShebangs .";

    postInstall = lib.optionalString stdenv.isDarwin ''
      substituteInPlace $out/bin/leanpkg \
        --replace "greadlink" "${coreutils}/bin/readlink"
    '';

    passthru = {
      emscripten = callPackage ./emscripten.nix {
        buildEmscriptenPackage =
          buildEmscriptenPackage.override { inherit emscripten; };
        leanSrc = src;
        inherit version;
      };
      # TODO: make it scoped to this lean.
      mkLibraryScript = leanUtils.mkLibraryScript { lean = drv; };
      # coreLibrary = leanUtils.mkLibrary { lean = drv; };
    };

    meta = with lib; {
      description = "Automatic and interactive theorem prover";
      homepage = "https://leanprover.github.io/";
      changelog =
        "https://github.com/leanprover-community/lean/blob/v${version}/doc/changes.md";
      license = licenses.asl20;
      platforms = platforms.unix;
      maintainers = with maintainers; [ thoughtpolice gebner ];
    };
  };
in drv
