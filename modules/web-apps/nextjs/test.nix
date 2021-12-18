import <nixpkgs/nixos/tests/make-test-python.nix> ({ pkgs, ... }: {
  machine = { pkgs, lib, ... }: {
    imports = [ ./default.nix ];

    services.nextjs.uniongov = let
      uniongov-src = pkgs.fetchFromGitHub {
        owner = "RaitoBezarius";
        repo = "uniongov";
        rev = "develop";
        sha256 = "sha256-I3Ln9mJRKWrKsk/S96qSXYrJwNojiondDtwtvP9ABPk=";
      };
      uniongov = import uniongov-src {};
    in
      {
        enable = true;
        src = uniongov-src;
        inherit (uniongov.frontend) nextDir nodeModules;
        port = 8000;
    };
  };
  testScript = ''
    with subtest("test"):
      machine.wait_for_unit("multi-user.target")

      with subtest("IT'S ALIVE"):
        machine.wait_for_unit("nextjs-uniongov.service")
        machine.wait_for_open_port(8000)
        machine.succeed("curl localhost:8000")
    '';
})

