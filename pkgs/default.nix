{ pkgs, lib ? pkgs.lib }:
let
  callPackage = lib.callPackageWith (pkgs // self);
  callPackageWithMerged = attrName: f: extraArgs:
    let
      mergedSubset = pkgs.${attrName} // self.${attrName};
      subsetArgs = builtins.listToAttrs [{ name = attrName; value = mergedSubset; }];
    in
    callPackage f (subsetArgs // extraArgs);
  self = rec {

    parentOverrides = self: super: python3PackagesPlus;
    mergeOverrides = lib.foldr lib.composeExtensions (self: super: { });
    python3 = pkgs.python3.override {
      packageOverrides = self: super: python3PackagesPlus;
    };

    lean-emscripten = (pkgs.lean.override {
      stdenv = pkgs.emscriptenStdenv;
    }).overrideDerivation (old: {
      pname = "lean-emscripten";
      inherit (old) buildInputs;
      dontStrip = true;

      NODE_OPTIONS = "--max-old-space-size=4096";
      configurePhase = ''
        runHook preConfigure

        emcmake cmake src/ -DCMAKE_BUILD_TYPE=Emscripten

        runHook postConfigure
      '';
      buildPhase = ''
        emcmake make
      '';
    });

    lean-with-githash =
    let
      githashSha1 = "13007ebb4de63859d9866c19f6e753bbf1852f41";
    in
      pkgs.lean.overrideAttrs (old: {
        preConfigure = ''
          substituteInPlace src/CMakeLists.txt \
          --replace "include(GetGitRevisionDescription)" "" \
          --replace "get_git_head_revision(GIT_REFSPEC GIT_SHA1)" "set(GIT_SHA1 \"${githashSha1}\")"
        '';
    });

    lean-game-maker = callPackage ./tools/lean-game-maker {
      python = pkgs.python3;
    }; # Lean game maker runtime
    make-lean-game = callPackage ./tools/make-lean-game.nix {
      lean = lean-with-githash; # FIXME: find a way to magically handle multiple versions of Lean at the same time and generate the proper JS/WASM versions.
    }; # Lean game maker function
    lean-games = {
      nng = callPackage ./lean-games/nng.nix {};
      game-skeleton = callPackage ./lean-games/game-skeleton.nix {};
    };

    galene = callPackage ./servers/galene {}; # Videoconferencing server
    etebase-server = callPackage ./servers/etebase { # Etebase server for calendar & etc.
      inherit python3;
    };
    etesync-web = callPackage ./servers/etesync-web {}; # Etesync web client.
    etesync-web-personal = (etesync-web.withCustomAPI "etebase.v6.lahfa.xyz"); # Personal instance.

    mySourcehut = callPackage ./sourcehut {}; # Sourcehut
    beauties = callPackage ./web-apps/beauties { }; # Personal essential Internet web services.
    cachet = callPackage ./web-apps/cachet { }; # Status page system.
    infcloud = callPackage ./web-apps/infcloud { }; # CalDAV/CardDAV web client.
    oragono = callPackage ./servers/oragono.nix { };
    inspircd = callPackage ./servers/inspircd { };
    python3PackagesPlus = callPackage ./python-packages {
      python = pkgs.python3;
      wafHook = callPackage ./development/wafHook {};
    };
  };
in
self
