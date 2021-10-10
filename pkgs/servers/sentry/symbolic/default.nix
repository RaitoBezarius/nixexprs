{ callPackage }:
rec {
  rust = callPackage ./rust.nix {};
  python = callPackage ./python.nix {
    rust-symbolic = rust;
  };
}

