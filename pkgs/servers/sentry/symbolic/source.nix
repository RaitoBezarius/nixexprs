{ fetchFromGitHub }:
rec {
  version = "8.3.1";
  src = fetchFromGitHub {
    owner = "getsentry";
    repo = "symbolic";
    rev = version;
    sha256 = "sha256-vesdWfg+tz121VyePEp9VHE1+4uYXlAlFLTCHpp45Ns=";
  };
}
