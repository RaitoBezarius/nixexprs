{ lib, stdenv, fetchFromGitHub, cmake, llvmPackages_11, libxml2, zlib, substituteAll }:

llvmPackages_11.stdenv.mkDerivation rec {
  version = "0.7.1";
  pname = "zig";

  src = fetchFromGitHub {
    owner = "RaitoBezarius";
    repo = pname;
    rev = "use-dwarf-everywhere"; # version;
    sha256 = "10d1x2f81kyamcsq113i8i21bkxvz2x8rfh42aizn1inddjz924k";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [
    llvmPackages_11.clang-unwrapped
    llvmPackages_11.llvm
    llvmPackages_11.lld
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
