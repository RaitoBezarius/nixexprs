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
    rev = "0e676f7310ec57eca56191fe42ca625a239101e7";
    sha256 = "0zkcmxlajcvhdpkllgz0cc6dq2y8ci9b6852wjr67q4wnbrgw38q";
  };

  meta = with stdenv.lib; {
    description = "Essential personal Internet services (pastebin, file upload, etc.)";
    homepage = "https://github.com/dsx/beauties";
    license = licenses.mit;
    maintainers = with maintainers; [];
    platforms = platforms.linux;
  };
}
