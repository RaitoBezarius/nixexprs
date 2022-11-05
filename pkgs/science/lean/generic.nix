{ lib, stdenv, fetchFromGitHub, cmake, gmp, coreutils, callPackage, version, src, githash
, buildEmscriptenPackage, emscripten, leanUtils, npmlock2nix, disableTests ? false }:
let
  drv = { checkOleanVersion ? true, enableAdvancedLogging ? false }: stdenv.mkDerivation (finalAttrs: {
    pname = "lean${lib.optionalString (!checkOleanVersion) "no-olean-version-check"}${lib.optionalString enableAdvancedLogging "-extra-olean-verbosity"}";
    inherit version src;
    nativeBuildInputs = [ cmake ];
    buildInputs = [ gmp ];

    cmakeDir = "../src";

    # Running the tests is required to build the *.olean files for the core
    # library.
    doCheck = !enableAdvancedLogging -> !disableTests; # advanced logging breaks the tests. TODO: fix it.

    cmakeFlags = [
      (lib.optionalString (!checkOleanVersion) "-DCHECK_OLEAN_VERSION=OFF")
    ];

    # TODO: merge/renumber patches.
    patches = [
      # ./patches/0002-shell-progress-add-a-flag-to-force-progress.patch TODO: this wont apply well. what to do?
    ] ++ lib.optional enableAdvancedLogging [
      ./patches/0003-emscripten-add-some-logging.patch
      ./patches/0001-module_mgr-log-attempt-to-load-oleans.patch
    ];


    preConfigure = assert builtins.stringLength githash == 40; ''
     substituteInPlace src/githash.h.in \
       --subst-var-by GIT_SHA1 "${githash}"
     substituteInPlace library/init/version.lean.in \
       --subst-var-by GIT_SHA1 "${githash}"
    '';

    postPatch = "patchShebangs .";

    postInstall = lib.optionalString stdenv.isDarwin ''
      substituteInPlace $out/bin/leanpkg \
        --replace "greadlink" "${coreutils}/bin/readlink"
    '';

    passthru = let
      myself = drv { inherit checkOleanVersion enableAdvancedLogging; };
    in
    {
      emscripten = callPackage ./emscripten.nix {
        buildEmscriptenPackage =
          buildEmscriptenPackage.override { inherit emscripten; };
        leanSrc = src;
        inherit version githash enableAdvancedLogging checkOleanVersion;
      };
      mkLibraryScript = leanUtils.mkLibraryScript { lean = myself; };
      withLibrary = leanUtils.mkLibrary { lean = myself; };
      coreLibrary = leanUtils.mkLibrary { lean = myself; } {};
      webEditor = callPackage ./web-editor.nix {
        inherit npmlock2nix;
        lean = myself;
      };
      debugOleans = drv { enableAdvancedLogging = true; inherit checkOleanVersion; };
      noOleanVersionCheck = drv { checkOleanVersion = false; inherit enableAdvancedLogging; };
    };

    meta = with lib; {
      description = "Automatic and interactive theorem prover";
      homepage = "https://leanprover.github.io/";
      changelog =
        "https://github.com/leanprover-community/lean/blob/v${version}/doc/changes.md";
      license = licenses.asl20;
      platforms = platforms.unix;
      maintainers = with maintainers; [ raitobezarius ];
    };
  });
in drv {}
