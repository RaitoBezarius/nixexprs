{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "wireguard-vanity-address";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "warner";
    repo = "wireguard-vanity-address";
    rev = "12-count-scalars";
    sha256 = "175vnjjf8z49k9p3x8qrnwpi23mhnccx6jh0nh5qmwbdsa98pn4z";
  };

  cargoSha256 = "094yb8a8994cglcwhj15bhn32rc66qi0w0q71qpyq2b492gd3lng";

  meta = with lib; {
    description = "A WireGuard public key vanity generator.";
    homepage = "https://github.com/warner/wireguard-vanity-address";
    license = licenses.mit;
  };
}
