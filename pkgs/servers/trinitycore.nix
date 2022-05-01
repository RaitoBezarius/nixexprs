{ stdenv, fetchFromGitHub, cmake, boost, zlib, readline, ncurses, mysql57, bzip2, openssl }:
stdenv.mkDerivation rec {
  pname = "trinity-core";
  version = "3.3.5a";

  src = fetchFromGitHub {
    owner = "TrinityCore";
    repo = "TrinityCore";
    rev = "3.3.5";
    sha256 = "sha256-5msCn/QBMlBwDefDRwXVYbwdoe/bFdhtfctuLfh0qDY=";
  };

  cmakeFlags = [ "-DWITHOUT_GIT=YES" ];

  buildInputs = [
    cmake
    boost
    zlib
    readline
    ncurses
    mysql57
    bzip2
    openssl
  ];
}
