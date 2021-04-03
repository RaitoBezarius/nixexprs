{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "wireguard-vanity-address";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "warner";
    repo = "wireguard-vanity-address";
    rev = "v0.4.0";
    sha256 = "1ni8isfg4c0szh2djhqlhynn1mj9qq2hpvlgx57hh7rxhiadqg2a";
  };

  cargoSha256 = "0wrilg7c0km9avpf86cjvw1590kvx8qgann0pj8wa56nlrbsnfdq";

  meta = with lib; {
    description = "A WireGuard public key vanity generator.";
    homepage = "https://github.com/warner/wireguard-vanity-address";
    license = licenses.mit;
  };
}
