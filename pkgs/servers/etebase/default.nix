{ lib, python3, fetchFromGitHub, mergeOverrides, parentOverrides }:

let
  py = python3.override {
    packageOverrides = mergeOverrides [ parentOverrides (self: super: {
        django = super.django_3;
      }) ];
    };
in
  with py.pkgs;

pythonPackages.buildPythonApplication rec {
  pname = "etebase-server";
  version = "0.5.3";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "etesync";
    repo = "server";
    rev = "v${version}";
    sha256 = "03bhdj7xviwcfaz5449psighdykgizhnv4n0298f6mgd4b5bwrp6";
  };

  patches = [ ./secret.patch ];

  propagatedBuildInputs = with pythonPackages; [
    asgiref
    cffi
    django
    django-cors-headers
    djangorestframework
    drf-nested-routers
    msgpack
    psycopg2
    pycparser
    pynacl
    pytz
    six
    sqlparse
  ];

  installPhase = ''
    mkdir -p "$out/bin" "$out/lib"
    mkdir -p "$out/share/doc/${pname}"
    mkdir -p "$out/share/licenses/${pname}"

    install -Dm644 "README.md" "$out/share/doc/${pname}/README.md"
    mv "example-configs" "$out/share/doc/${pname}/"

    install -Dm644 "LICENSE" "$out/share/licenses/${pname}/LICENSE"

    cp -r "." "$out/lib/${pname}"

    ln -s "$out/lib/${pname}/manage.py" "$out/bin/${pname}"
    wrapProgram "$out/bin/${pname}" --prefix PYTHONPATH : "$PYTHONPATH"
    chmod +x "$out/bin/etebase-server"
  '';

  meta = with lib; {
    homepage = "https://github.com/etesync/server";
    description = "An Etebase (EteSync 2.0) server so you can run your own.";
    license = licenses.agpl3Only;
    # maintainers = with maintainers; [ felschr ];
  };
}
