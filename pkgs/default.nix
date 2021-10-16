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

    lean = import ./science/lean {
      inherit lib callPackage;
      inherit (pkgs) fetchFromGitHub;
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

    myNixops = callPackage ./nixops {}; # My NixOps
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

    wireguard-vanity-address = callPackage ./tools/wireguard-vanity-address.nix {};
    zig = callPackage ./compilers/zig.nix {};
    emscripten = callPackage ./compilers/emscripten {
      binaryen = pkgs.binaryen.overrideAttrs (old: {
        version = "101";
        src = pkgs.fetchFromGitHub {
          owner = "WebAssembly";
          repo = "binaryen";
          rev = "version_101";
          sha256 = "sha256-rNiZQIQqNbc1P2A6UTn0dRHeT3BS+nv1o81aPaJy+5U=";
        };
      });
    };


    emscriptenfastcompPackages = lib.dontRecurseIntoAttrs (callPackage ./compilers/emscripten/fastcomp {
      emscriptenVersion = "1.39.1";
    });
    inherit (emscriptenfastcompPackages) emscriptenfastcomp;
    emscripten1 = callPackage ./compilers/emscripten/emscripten1.nix {
      emscriptenVersion = "1.39.1";
    };
    binaryen1 = callPackage ./compilers/binaryen1 {};

    isso = callPackage ./servers/isso {};
    nodePackages = pkgs.nodePackages // (callPackage ./node-packages {});
  };
in
self
