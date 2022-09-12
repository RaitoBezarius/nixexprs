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

    inherit callPackage;

    parentOverrides = self: super: python3PackagesPlus;
    mergeOverrides = lib.foldr lib.composeExtensions (self: super: { });
    python3 = pkgs.python3.override {
      packageOverrides = self: super: python3PackagesPlus;
    };

    npmlock2nix = callPackage (pkgs.fetchFromGitHub {
      owner = "nix-community";
      repo = "npmlock2nix";
      rev = "33eb3300561d724da64a46ab8e9a05a9cfa9264b";
      sha256 = "sha256-xguvgtrIQHPxpc4J6EhfBnYtQDGJpt6hK1dN7KEi8R4=";
    }) {};

    lean = import ./science/lean {
      inherit lib callPackage npmlock2nix;
      inherit (pkgs) fetchFromGitHub;
      emscripten = workingEmscripten;
    };
    makeLeanGame = callPackage ./science/lean/make-lean-game.nix {};
    leanGames = callPackage ./science/lean/lean-games {};
    lean-game-maker = callPackage ./science/lean/lean-game-maker {
      python = pkgs.python3;
    };

    emscriptenPackages = {
      lean = lib.mapAttrs (_: p: p.emscripten) lean;
    };

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

    etebase-server = callPackage ./servers/etebase { # Etebase server for calendar & etc.
      inherit python3;
    };
    etesync-web = callPackage ./servers/etesync-web {}; # Etesync web client.
    etesync-web-personal = (etesync-web.withCustomAPI "etebase.v6.lahfa.xyz"); # Personal instance.

    myNixops = callPackage ./nixops {}; # My NixOps
    mySourcehut = callPackage ./sourcehut {}; # Sourcehut
    beauties = callPackage ./web-apps/beauties { }; # Personal essential Internet web services.
    infcloud = callPackage ./web-apps/infcloud { }; # CalDAV/CardDAV web client.
    python3PackagesPlus = callPackage ./python-packages {
      python = pkgs.python3;
      wafHook = callPackage ./development/wafHook {};
    };

    wireguard-vanity-address = callPackage ./tools/wireguard-vanity-address.nix {};
    zig = callPackage ./compilers/zig.nix {};
    # contains the patch for EM_CACHE feature.
    workingEmscripten = pkgs.emscripten.overrideAttrs (old: {
      version = "0fb2eee8065a9a9e9852dc5fb6ab9a20d9f45772";
      src = pkgs.fetchFromGitHub {
        owner = "emscripten-core";
        repo = "emscripten";
        sha256 = "sha256-a1T5n2SZckNZBGEG+N3E2RuoNOkE3PEC/TB9Zb5K+ng=";
        rev = "0fb2eee8065a9a9e9852dc5fb6ab9a20d9f45772";
      };
    });

    isso = callPackage ./servers/isso {};
    nodePackages = pkgs.nodePackages // (callPackage ./node-packages {});

    trinitycore = callPackage ./servers/trinitycore.nix {};

    # My scripts
    kachpass = callPackage ./tools/kachpass {};
  };
in
self
