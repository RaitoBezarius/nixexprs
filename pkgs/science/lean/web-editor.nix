{ npmlock2nix, fetchFromGitHub, lean, library ? lean.coreLibrary }:
npmlock2nix.build {
  src = fetchFromGitHub {
    owner = "RaitoBezarius";
    repo = "lean-web-editor";
    rev = "b210fea45fb722beff14991e6137be18262ae865";
    sha256 = "sha256-z8jlRWmiacexL5XrbAArfmPktGGqvDq3th21S4TNTRw=";
  };

  installPhase = ''
    cp -r ${lean.emscripten} $out/
    echo "emscripten WASM runtime files copied."
    cp -r ${library} $out/
    echo "core library files copied."
    cp -r dist $out/
    echo "web editor files copied."
  '';

  buildCommands = [ "npm run build" ];
}
