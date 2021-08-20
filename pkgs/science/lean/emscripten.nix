{ buildEmscriptenPackage, cmake, m4, libtool, leanSrc, version }:
let
  gmpSrc = fetchTarball {
    url = "https://gmplib.org/download/gmp/gmp-6.1.2.tar.bz2";
    sha256 = "15xl9qaacbq9i5822g8nvr4xx859pypvxjngcig5344pyi14rck5";
  };
in
  buildEmscriptenPackage rec {
    pname = "lean-emscripten";
    inherit version;
    buildInputs = [ cmake m4 libtool ];

    src = leanSrc;
    configurePhase = ''
      sed -i 's/.*URL .*' 'SOURCE_DIR=${gmpSrc}' $src/src/CMakeLists.txt
      sed -i 's/URL_HASH/d' $src/src/CMakeLists.txt

      emcmake cmake -S $src/src -B $TMPDIR -DCMAKE_BUILD_TYPE=Emscripten
    '';

    buildPhase = ''
      cd $out
      emmake make lean_js_js
      emmake make lean_js_wasm
    '';

    installPhase = ''
    '';

    checkPhase = "";
  }
