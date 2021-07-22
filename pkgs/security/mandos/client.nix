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
  name = "mandos-client";
  src = fetchFromGitHub {
    owner = "RaitoBezarius";
    repo = "mandos";
    rev = "a9eba6c3498c09e6ac45125efeb56a9e612a1e3e";
    sha256 = "13lclmx0ycc298yxi9930b5wd74ald2fx8g0wws5yz09kjx5bpf3";
  };
  buildInputs = [  docbook5 docbook_xsl docbook_xsl_ns docbook_xml_dtd_42 docbook_xml_dtd_45 ];
  nativeBuildInputs =
    [ gnutls avahi pkg-config libxslt gpgme systemd libnl
    (python3.withPackages (p: [ p.dbus-python p.pygobject3 ]))
    autoPatchelfHook
  ];
  configurePhase = ''
      substituteInPlace Makefile \
      --replace "/usr/share/xml/docbook/stylesheet/nwalsh/manpages/docbook.xsl" "${docbook_xsl_ns}/xml/xsl/docbook/manpages/docbook.xsl" \
      --replace "--mode=u=rwxs" "--mode=u=rwx"
  '';

  makeFlags = [
    "PREFIX=$(out)" "DESTDIR=$(out)" "MANDIR=$(out)/man" "CONFDIR=$(out)/etc" "LIBDIR=$(out)/lib" "KEYDIR=$(out)/etc/keys" "STATEDIR=$(out)/var"
    "INITRAMFSDIR=$(out)/initramfs"
    "DRACUTMODULE=$(out)/dracut"
  ];
  buildFlags = [ "mandos" ];
  installTargets = "install-client-nokey";

  meta = with stdenv.lib; {
    description = "Password client for automatic full disk encryption unlocking";
    homepage = "https://www.recompile.se/mandos";
    license = stdenv.lib.licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [];
  };
}
