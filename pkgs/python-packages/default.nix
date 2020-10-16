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
}
