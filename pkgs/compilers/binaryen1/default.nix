{ stdenv, cmake, python3, fetchFromGitHub, emscriptenRev ? null, substituteAll, lib }:

let
  defaultVersion = "95";

  # Map from git revs to SHA256 hashes
  sha256s = {
    version_95 = "1w4js9bm5qv5aws8bzz4f0n3ni2l7h4fidkq9v5bldf0zxncy8m3";
    "1.39.1" = "0ygm9m5322h4vfpf3j63q32qxk2l26yk62hh7dkb49j51zwl1y3y";
  };
in

stdenv.mkDerivation rec {
  version = if emscriptenRev == null
            then defaultVersion
            else "emscripten-${emscriptenRev}";
  rev = if emscriptenRev == null
        then "version_${version}"
        else emscriptenRev;
  pname = "binaryen";

  src = fetchFromGitHub {
    owner = "WebAssembly";
    repo = "binaryen";
    sha256 =
      if builtins.hasAttr rev sha256s
      then builtins.getAttr rev sha256s
      else null;
    inherit rev;
  };

  patches = lib.optional (emscriptenRev != null) (substituteAll {
    src = ./0001-Get-rid-of-git-dependency.patch;
    emscriptenv = "1.39.1";
  });

  nativeBuildInputs = [ cmake python3 ];

  meta = with lib; {
    homepage = "https://github.com/WebAssembly/binaryen";
    description = "Compiler infrastructure and toolchain library for WebAssembly, in C++";
    platforms = platforms.all;
    maintainers = with maintainers; [ asppsa ];
    license = licenses.asl20;
  };
}
