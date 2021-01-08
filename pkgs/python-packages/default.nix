{ callPackage, python, wafHook }:
{
  blivet3 = callPackage ./blivet {
    inherit python;
    pythonPackages = python.pkgs;
  };

  ns-3 = callPackage ./ns-3 {
    python3 = python;
    inherit wafHook;
  };

  drf-nested-routers = callPackage ./drf-nested-routers {
    inherit (python.pkgs) buildPythonPackage fetchPypi setuptools django djangorestframework;
  };
}
