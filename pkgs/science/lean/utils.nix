{ lib, writers, stdenv }:
# mkLibrary returns the ZIP drv for library.zip
rec {
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
    writers.writePython3Bin "lean-mklibrary" { flakeIgnore = [ "E501" ]; } customizedSrc;

  mkLibrary = { lean ? null }: { coreOnly ? true, bundlePath ? null }: stdenv.mkDerivation {
    name = "${lean.name}-library-${if coreOnly then "core-only" else ""}";

    phases = [ "buildPhase" ];

    buildPhase = ''
      mkdir -p $out/
      ${mkLibraryScript { inherit lean; }}/bin/lean-mklibrary ${if bundlePath != null then "-i ${bundlePath} " else ""}-o $out/library.zip${if coreOnly then " -c" else ""}
    '';
  };
}
