{ lib, stdenv, fetchFromGitHub, cmake, llvmPackages_12, libxml2, zlib, substituteAll }:

llvmPackages_12.stdenv.mkDerivation rec {
  version = "0.8.0";
  pname = "zig";

  src = fetchFromGitHub {
    owner = "RaitoBezarius";
    repo = pname;
    rev = "use-dwarf-everywhere"; # version;
    sha256 = "sha256-LuPX+Cs2WnJl5f8zoZMd9/CHGhomnlpLga89PMZv1gc=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [
    llvmPackages_12.clang-unwrapped
    llvmPackages_12.llvm
    llvmPackages_12.lld
    libxml2
    zlib
  ];

  preBuild = ''
    export HOME=$TMPDIR;
  '';

  checkPhase = ''
    runHook preCheck
    ./zig test --cache-dir "$TMPDIR" -I $src/test $src/test/stage1/behavior.zig
    runHook postCheck
  '';

  doCheck = true;

  meta = with lib; {
    description =
      "General-purpose programming language and toolchain for maintaining robust, optimal, and reusable software";
    homepage = "https://ziglang.org/";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = [ maintainers.andrewrk ];
    # See https://github.com/NixOS/nixpkgs/issues/86299
    broken = stdenv.isDarwin;
  };
}
