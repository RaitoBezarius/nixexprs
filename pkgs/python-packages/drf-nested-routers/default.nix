{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, django
, djangorestframework
}:

buildPythonPackage rec {
  pname = "drf-nested-routers";
  version = "0.92.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0rizimr0sxzspc8gn1fd2z1bp62x0wkkr29vwr4nbcg96dik4slx";
  };

  propagateBuildInputs = [ setuptools ];
  buildInputs = [ django djangorestframework ];
  doCheck = false;

  meta = {
    homepage = "https://github.com/alanjds/drf-nested-routers";
    description = "Provides routers and fields to create nested resources in the Django Rest Framework";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ felschr ];
  };
}
