{ lib, writers, stdenv, git, cacert }:
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


    mkLibrary = { lean ? null }: { bundlePath ? null, coreOnly ? bundlePath == null, bundleSha256 ? null, useFOD ? true, useOldOleans ? false }:
    let
      name = "${lean.name}-library${if coreOnly then "-core-only" else ""}";
      phases = [ "buildPhase" ];
      buildPhase = ''
        mkdir -p $out/
        ${if bundlePath != null then ''
          mkdir -p $TMPDIR/bundle
          cp -rv ${bundlePath}/* $TMPDIR/bundle/
          chmod -R u+rw $TMPDIR/bundle
        '' else ""}
        cd $TMPDIR
        ${mkLibraryScript { inherit lean; }}/bin/lean-mklibrary ${lib.optionalString useOldOleans "-t "}${lib.optionalString (bundlePath != null) "-i $TMPDIR/bundle "}-o $out/library.zip${lib.optionalString coreOnly " -c"}
      '';
    in
    if bundlePath != null then
      assert useFOD -> bundleSha256 != null;
      stdenv.mkDerivation {
        inherit name phases buildPhase;
        buildInputs = [ git cacert ];
      } // (if useFOD then {
        outputHashMode = "recursive";
        outputHashAlgo = "sha256";
        outputHash = bundleSha256;
      } else {})
    else stdenv.mkDerivation { inherit name phases buildPhase; };
}
