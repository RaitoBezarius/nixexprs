# Example de modules:
# {
#  "name" = "ssl_openssl";
#  "ext" = "cpp";
#  "buildDeps" = [pkgs.openssl pkgs.pkgconfig];
# } {
#  "name" = "ssl_gnutls";
#  "ext" = "cpp";
#  "buildDeps" = [pkgs.gnutls pkgs.pkgconfig];
# } {
#  "name" = "totp";
#  "ext" = "cpp";
#  "repo" = pkgs.fetchFromGitHub {
#         owner = "flopraden";
#         repo = "inspircd-contrib";
#         rev = "master";
#         sha256 = "1fw9hgv203zb3diqy0c1r092gsa0ija4s0pmdprz6v7h26jqvcv6";
#         };
#  "path" = "/3.0";
#  "buildDeps" = [];
# }
{ fetchFromGitHub, stdenv, perl, lib, modules ? [ ], ... }:
with builtins;
let
  extra = filter (mod: !(mod ? "repo")) modules;
  contrib = filter (mod: (mod ? "repos")) modules;
  extraModules = map (mod: "m_${mod.name}.${mod.ext}") modules;
  extraModulesBuildDeps = lib.flatten (map (mod: mod.buildDeps) modules);
in stdenv.mkDerivation rec {
  pname = "inspircd";
  version = "3.7.0";

  src = fetchFromGitHub {
    owner = "flopraden";
    repo = "inspircd";
    rev = "v${version}";
    sha256 = "1npzp23c3ac7m1grkm39i1asj04rs4i0jwf5w0c0j0hmnwslnz7a";
  };

  enableParallelBuilding = true;

  outputs = [ "out" "dev" ];
  nativeBuildInputs = lib.unique ([ perl ] ++ extraModulesBuildDeps);

  postUnpack = (if (length contrib) > 0 then
    concatStringsSep "\n" (map (mod:
      "cp -f ${mod.repo}/${mod.path}/m_${mod.name}.${mod.ext} $sourceRoot/src/modules/extra/")
      contrib)
  else
    "");

  preConfigure = ''
    patchShebangs ./configure
    patchShebangs ./make/unit-cc.pl
  '';

  configurePhase = ''
    runHook preConfigure ;

  '' + (if (length extraModules) > 0 then
    "./configure --enable-extras=" + concatStringsSep "," extraModules
  else
    "") + ''

      ./configure --disable-interactive \
         --disable-auto-extras \
         --prefix=$prefix \
         --manual-dir=$out/share/man/man1 \
         --binary-dir=$out/bin \
         --example-dir=$out/share/examples \
         --log-dir=/var/log/inspircd \
         --config-dir=/etc/inspircd \
         --data-dir=/run/inspircd \
         --script-dir=$out/share/scripts \
         --module-dir=$out/lib/modules
    '';

  postInstall = ''
    cp -r $src/locales $out/share/
    mkdir -p $dev/include
    cp -R $src/include/* $dev/include
  '';

  meta = with stdenv.lib; {
    homepage = "https://www.inspircd.org/";
    description = "A modular C++ IRC server";
    platforms = platforms.unix;
    license = licenses.gpl2Plus;
  };
}
