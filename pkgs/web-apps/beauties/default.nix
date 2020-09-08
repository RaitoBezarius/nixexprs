{ stdenv, buildGoModule, go-bindata, fetchFromGitHub }:

buildGoModule rec {
  pname = "beauties";
  version = "0.0.14.0";

  vendorSha256 = null;
  doCheck = false;

  nativeBuildInputs = [ go-bindata ];

  subPackages = ["cmd/beauties"];

  preBuild = ''
    	go generate github.com/dsx/beauties/cmd/...
  '';

  src = fetchFromGitHub {
    owner = "RaitoBezarius";
    repo = pname;
    rev = "fbfa29e9df856a2bc755babd8540d56a4253c5ac";
    sha256 = "1nzj2vpbqpcpfs78b6s4il6lb6bslrdvjwmjgsqscb3m9vqdrxxy";
  };

  meta = with stdenv.lib; {
    description = "Essential personal Internet services (pastebin, file upload, etc.)";
    homepage = "https://github.com/dsx/beauties";
    license = licenses.mit;
    maintainers = with maintainers; [];
    platforms = platforms.linux;
  };
}
