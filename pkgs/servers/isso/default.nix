{ lib, nodejs, callPackage, python3Packages, fetchFromGitHub }:
let
  nodeDependencies = (callPackage ./js {}).shell.nodeDependencies;
in
with python3Packages; buildPythonApplication rec {

  pname = "isso";
  version = "0.12.5";

  # no tests on PyPI
  src = fetchFromGitHub {
    owner = "posativ";
    repo = pname;
    rev = version;
    sha256 = "12ccfba2kwbfm9h4zhlxrcigi98akbdm4qi89iglr4z53ygzpay5";
  };

  propagatedBuildInputs = [
    itsdangerous
    jinja2
    misaka
    html5lib
    werkzeug
    bleach
    flask-caching
  ];

  nativeBuildInputs = [
    cffi
    nodejs
  ];

  checkInputs = [ nose ];

  checkPhase = ''
    ${python.interpreter} setup.py nosetests
  '';

  preBuild = ''
    ln -s ${nodeDependencies}/lib/node_modules/ ./node_modules
    export PATH="${nodeDependencies}/bin:$PATH"

    make js
  '';

  meta = with lib; {
    description = "A commenting server similar to Disqus";
    homepage = "https://posativ.org/isso/";
    license = licenses.mit;
    maintainers = with maintainers; [ fgaz ];
  };
}

