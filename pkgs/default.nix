{ pkgs }:
let
  callPackage = pkgs.lib.callPackageWith (pkgs // self);
  callPackageWithMerged = attrName: f: extraArgs:
    let
      mergedSubset = pkgs.${attrName} // self.${attrName};
      subsetArgs = builtins.listToAttrs [{ name = attrName; value = mergedSubset; }];
    in
    callPackage f (subsetArgs // extraArgs);
  self = rec {

    beauties = callPackage ./web-apps/beauties { }; # Personal essential Internet web services.
    infcloud = callPackage ./web-apps/infcloud { }; # CalDAV/CardDAV web client.
    python3PackagesPlus = callPackage ./python-packages {
      python = pkgs.python3;
    };
  };
in
self
