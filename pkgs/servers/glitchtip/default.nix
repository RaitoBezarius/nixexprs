{ fetchFromGitLab, poetry2nix, npmlock2nix, ncurses, rustPlatform }:
{
  backend = (poetry2nix.mkPoetryApplication rec {
    src = fetchFromGitLab {
      repo = "glitchtip-backend";
      owner = "glitchtip";
      rev = "v1.8.3";
      sha256 = "sha256-dRpJDHwiAAwnThh64OrvkzXhMNk65UdgmMT12448MzU=";
    };
    pyproject = "${src}/pyproject.toml";
    poetrylock = "${src}/poetry.lock";
    overrides = poetry2nix.overrides.withDefaults (self: super: {
      uwsgi = super.uwsgi.overridePythonAttrs (old: {
        buildInputs = (old.buildInputs or []) ++ [ ncurses ];
        sourceRoot = ".";
      });
      symbolic = super.symbolic.overridePythonAttrs (old: {
        buildInputs = (old.buildInputs or []) ++ (with rustPlatform.rust; [ rustc cargo ]);
      });
    });
  }).dependencyEnv;

  frontend = npmlock2nix.build {
    src = fetchFromGitLab {
      repo = "glitchtip-frontend";
      owner = "glitchtip";
      rev = "v1.8.3";
      sha256 = "sha256-WrAmiEXBnvBToEu33IgGr4eUPhetlX7YMc6cMXp0QH8=";
    };
    installPhase = "cp -r dist $out";
    buildCommands = [ "npm run build-prod" ];
  };
}
