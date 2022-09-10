{
  stdenv
  , fetchFromGitHub
  , docbook5
  , docbook_xsl
  , docbook_xsl_ns
  , docbook_xml_dtd_42
  , docbook_xml_dtd_45
  , gnutls
  , avahi
  , python3
  , pkg-config
  , libxslt
  , gpgme
  , systemd
  , libnl
  , autoPatchelfHook
}:

stdenv.mkDerivation {
  name = "mandos-server";
  src = fetchFromGitHub {
    owner = "RaitoBezarius";
    repo = "mandos";
    rev = "78515bb3f6aa8b9314e1211dc8660e5a5b4b048b";
    sha256 = "08y1lz0j79h8h2zx5a4nsm0vp37v2w92msf6j9f79k28h6fbnxp9";
  };
  buildInputs = [  docbook5 docbook_xsl docbook_xsl_ns docbook_xml_dtd_42 docbook_xml_dtd_45
    (python3.withPackages (p: [ p.dbus-python p.pygobject3 ])) gnutls gpgme libnl ];
  nativeBuildInputs =
    [ pkg-config libxslt avahi systemd
      autoPatchelfHook
  ];
  configurePhase = ''
      substituteInPlace Makefile \
      --replace "/usr/share/xml/docbook/stylesheet/nwalsh/manpages/docbook.xsl" "${docbook_xsl_ns}/xml/xsl/docbook/manpages/docbook.xsl" \
      --replace "--mode=u=rwxs" "--mode=u=rwx"

      substituteInPlace mandos \
      --replace "_library = ctypes.cdll.LoadLibrary(library)" "_library = ctypes.cdll.LoadLibrary(\"${gnutls.out}/lib/libgnutls.so\")"
  '';

  makeFlags = [ "PREFIX=$(out)" "DESTDIR=$(out)" "MANDIR=$(out)/man" "CONFDIR=$(out)/etc" "LIBDIR=$(out)/lib" "KEYDIR=$(out)/etc/keys" "STATEDIR=$(out)/var"];
  buildFlags = [ "mandos" ];
  installTargets = "install-server";

  postInstall = ''
    patchShebangs $out/bin/
  '';

  checkPhase = ''
    mandos --check
    mandos-ctl --check
  '';

  meta = with stdenv.lib; {
    description = "Password server for automatic full disk encrypt unlocking";
    homepage = "https://www.recompile.se/mandos";
    license = stdenv.lib.licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [];
  };
}
