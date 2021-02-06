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

    lean-game-maker = callPackage ./tools/lean-game-maker {
      python = pkgs.python3;
    }; # Lean game maker runtime
    make-lean-game = callPackage ./tools/make-lean-game.nix {}; # Lean game maker function
    lean-games = {
      nng = make-lean-game {
        src = pkgs.fetchFromGitHub {
          owner = "ImperialCollegeLondon";
          repo = "natural_number_game";
          rev = "e662e49ac977d4f0bbe53502e677e18025f9394c";
          sha256 = "0fy7i936akgy98zs2jk99q6d03dknh8fp0kkrla096flmhrlz67d";
        };
        gameConfig = {
          name = "Natural Number Game";
          version = "1.3.3";
          intro = "src/game/intro.lean";
        };
        noLibrary = true;
      };
    };

    galene = callPackage ./servers/galene {}; # Videoconferencing server
    etebase-server = callPackage ./servers/etebase { # Etebase server for calendar & etc.
      inherit python3;
    };
    etesync-web = callPackage ./servers/etesync-web {}; # Etesync web client.
    etesync-web-personal = (etesync-web.withCustomAPI "etebase.v6.lahfa.xyz"); # Personal instance.

    mySourcehut = callPackage ./sourcehut {}; # Sourcehut
    beauties = callPackage ./web-apps/beauties { }; # Personal essential Internet web services.
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
