{ npmlock2nix, symlinkJoin, fetchFromGitHub, lean, library ? lean.coreLibrary }:
symlinkJoin {
  name = "${lean.name}-web-editor-using-${library.name}";
  paths = [
    (npmlock2nix.build {
      src = fetchFromGitHub {
        owner = "RaitoBezarius";
        repo = "lean-web-editor";
        rev = "b210fea45fb722beff14991e6137be18262ae865";
        sha256 = "sha256-z8jlRWmiacexL5XrbAArfmPktGGqvDq3th21S4TNTRw=";
      };

      installPhase = "cp -r dist $out";
      buildCommands = [ "npm run build" ];
    })
    lean.emscripten
    library
  ];
}

