{ newScope, stdenv, binutils, wrapCCWith, symlinkJoin, lib, emscriptenVersion }:
let
  callPackage = newScope (self // {inherit stdenv emscriptenVersion;});

  self = {
    emscriptenfastcomp-unwrapped = callPackage ./emscripten-fastcomp.nix {};
    emscriptenfastcomp-wrapped = wrapCCWith {
      cc = self.emscriptenfastcomp-unwrapped;
      # Never want Apple's cctools for WASM target
      bintools = binutils;
      libc = stdenv.cc.libc;
      extraBuildCommands = ''
        # hardening flags break WASM support
        cat > $out/nix-support/add-hardening.sh
      '';
    };
    emscriptenfastcomp = symlinkJoin {
      name = "emscriptenfastcomp-${lib.getVersion self.emscriptenfastcomp-unwrapped}";
      paths = [ self.emscriptenfastcomp-wrapped self.emscriptenfastcomp-unwrapped ];
      preferLocalBuild = false;
      allowSubstitutes = true;
      postBuild = ''
        # replace unwrapped clang-3.9 binary by wrapper
        ln -sf $out/bin/clang $out/bin/clang-[0-9]*
      '';
    };
  };
in self
