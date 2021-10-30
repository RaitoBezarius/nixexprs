{ lib, writers }:
# mkLibrary returns the ZIP drv for library.zip
{
  mkLibraryScript = { lean ? null }: let
    src = builtins.readFile ./mk_library.py;
    replacements = []
    ++ lib.optional (lean != null) [ "\"lean\"" "\"${lean}/bin/lean\"" ]
    ++ lib.optional (lean != null) [ "leanpkg" "${lean}/bin/leanpkg" ];
    customizedSrc = builtins.replaceStrings
      (map (i: builtins.elemAt i 0) replacements)
      (map (i: builtins.elemAt i 1) replacements)
      src;
    in
    writers.writePython3Bin "lean-mklibrary" {} customizedSrc;
}
