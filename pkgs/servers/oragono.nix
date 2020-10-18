{ stdenv, fetchFromGitHub, buildGoModule }:
let
  version = "2.3.0";
  src = fetchFromGitHub {
    owner = "oragono";
    repo = "oragono";
    rev = "v${version}";
    sha256 = "m/8MVIy+kQN2NLhZ4hS+TAhPn5ozFrOsb5G1haSsUU0=";
  };
  goMod = buildGoModule {
    pname = "oragono-bin";
    inherit src version;
    vendorSha256 = null;
  };
in
  stdenv.mkDerivation {
    pname = "oragono";
    inherit src version;

    dontBuild = true;
    dontFixup = true;

    installPhase = ''
      mkdir -p $out/bin
      cp ${goMod}/bin/oragono $out/bin/oragono
      mkdir -p $out/etc
      cp default.yaml $out/etc/ircd.yaml
      mkdir -p $out/share
      cp -r languages $out/share
    '';

    meta = with stdenv.lib; {
      homepage = "https://oragono.io";
      description = "Modern IRC server written in Go";
      license = licenses.mit;
      maintainers = with maintainers; [ ];
    };
  }
