{ buildEmscriptenPackage, cmake, m4, libtool, texinfo, leanSrc, version }:
let
  gmpSrc = fetchTarball {
    url = "https://gmplib.org/download/gmp/gmp-6.1.2.tar.bz2";
    sha256 = "15xl9qaacbq9i5822g8nvr4xx859pypvxjngcig5344pyi14rck5";
  };
in
  buildEmscriptenPackage rec {
    pname = "lean";
    inherit version;
    buildInputs = [ cmake libtool texinfo ];
    nativeBuildInputs = [ m4 ];

    src = leanSrc;

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

      emcmake cmake -S src -B $TMPDIR/build
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
  }
