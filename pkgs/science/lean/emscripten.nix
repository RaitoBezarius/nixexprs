{ lib, buildEmscriptenPackage, cmake, m4, libtool, texinfo, leanSrc, version, githash, checkOleanVersion ? true, enableAdvancedLogging ? false }:
let
  gmpSrc = fetchTarball {
    url = "https://gmplib.org/download/gmp/gmp-6.1.2.tar.bz2";
    sha256 = "15xl9qaacbq9i5822g8nvr4xx859pypvxjngcig5344pyi14rck5";
  };
  drv = { useOldOleans ? false }: buildEmscriptenPackage rec {
    pname = "lean${lib.optionalString useOldOleans "-with-old-oleans"}${lib.optionalString (!checkOleanVersion) "-no-olean-version-check"}${lib.optionalString enableAdvancedLogging "-extra-olean-verbosity"}";
    inherit version;
    buildInputs = [ cmake libtool texinfo ];
    nativeBuildInputs = [ m4 ];

    src = leanSrc;

    # TODO: merge/renumber patches.
    patches = [
      # Enable building with emscripten v2 and exceptions handling.
      ./patches/0001-cmake-emscripten-update-build-flags-for-emscripten-2.patch
    ]
    ++ lib.optional useOldOleans ./patches/0001-javascript-use-old-oleans.patch # this enforces usage of old oleans in the sense of transitive hashes.
    ++ lib.optional enableAdvancedLogging ./patches/0003-emscripten-add-some-logging.patch;

    passthru = {
      withOldOleans = drv { useOldOleans = true; };
    };

    preConfigure = assert builtins.stringLength githash == 40; ''
     substituteInPlace src/githash.h.in \
       --subst-var-by GIT_SHA1 "${githash}"
     substituteInPlace library/init/version.lean.in \
       --subst-var-by GIT_SHA1 "${githash}"
    '';

    configurePhase = ''
      export HOME=$TMPDIR

      export EM_CACHE=$TMPDIR/emscripten-cache
      mkdir -p $EM_CACHE
      chmod -R u+w $EM_CACHE

      # Because it is going to write into it…
      cp -r ${gmpSrc} $TMPDIR/gmp
      chmod -R u+w $TMPDIR/gmp
      sed -i "s|.*URL .*|            SOURCE_DIR \"$TMPDIR/gmp\"|" src/CMakeLists.txt
      sed -i "/URL_HASH/d" src/CMakeLists.txt

      emcmake cmake -S src -B $TMPDIR/build ${lib.optionalString (!checkOleanVersion) "-DCHECK_OLEAN_VERSION=OFF"}
    '';

    buildPhase = ''
      export EM_CACHE=$TMPDIR/emscripten-cache
      cd $TMPDIR/build
      emmake make lean_js_js
      emmake make lean_js_wasm
    '';

    installPhase = ''
      mkdir -p $out/
      cp $TMPDIR/build/shell/lean_js_* $out/
    '';

    checkPhase = "";
  };
in
  (drv {})

