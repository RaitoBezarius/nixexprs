{ stdenv, fetchFromGitHub, buildGoModule }:
let
  version = "0.1";
  src = fetchFromGitHub {
    owner = "jech";
    repo = "galene";
    rev = "v${version}";
    sha256 = "1s13hbzxdi059za7jhhcjy0daz04vh7sirmgnspid0xd4wh94mxf";
  };
in
  buildGoModule {
    pname = "galene";
    inherit src version;

    vendorSha256 = "0wi32aba0m2gc10kczs3v1lzwfm92xbc0j1ykq0ahvz4623r1dqc";
    meta = with stdenv.lib; {
      homepage = "https://galene.org";
      description = "Videoconferencing server";
      license = licenses.mit;
      maintainers = with maintainers; [ ];
    };
  }
