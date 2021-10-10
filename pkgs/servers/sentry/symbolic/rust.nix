{ fetchFromGitHub, rustPlatform, pkg-config, openssl, lib }:
let
  source = import ./source.nix { inherit fetchFromGitHub; };
in
rustPlatform.buildRustPackage rec {
  pname = "rust-symbolic";
  version = source.version;
  cargoSha256 = lib.fakeSha256;
  buildInputs = [ pkg-config openssl ];
  inherit (source) src;
}
