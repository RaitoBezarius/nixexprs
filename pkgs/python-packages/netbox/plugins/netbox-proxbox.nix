{ fetchFromGitHub, poetry2nix, lib }:
poetry2nix.mkPoetryApplication rec {
  src = fetchFromGitHub {
    owner = "RaitoBezarius";
    repo = "netbox-proxbox";
    rev = "develop";
    sha256 = "sha256-Xcw3h6YGNYeKVwVkE1C5qVHzloaIoYoYedOiCtJx1fI=";
  };
  pyproject = "${src}/pyproject.toml";
  poetrylock = "${src}/poetry.lock";
}
