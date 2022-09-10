{ callPackage, ... }:
{
  server = callPackage ./server.nix {};
  client = callPackage ./client.nix {};
}
