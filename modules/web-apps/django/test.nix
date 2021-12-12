import <nixpkgs/nixos/tests/make-test-python.nix> ({ pkgs, ... }: {
  machine = { pkgs, lib, ... }: {
    imports = [ ./default.nix ];

    services.django.test = {
      enable = true;
      package = (import (fetchFromGitHub {
        owner = "RaitoBezarius";
        repo = "uniongov";
        rev = "";
        sha256 = lib.fakeSha256;
      }) {}).backend.app;
      settingsModule = "unionGov.settings";
      wsgiEntryPoint = "unionGov.wsgi:application";
      environment = {
        SECRET_KEY = "gXizOjVKrh-gQAo345jObYyRNpb-4bbG5jZqaijf_J0";
      };
      unitMode = "notify";
    };
  };
  testScript = ''
    with subtest("test"):
      machine.wait_for_unit("multi-user.target")

      with subtest("IT'S ALIVE"):
        machine.wait_for_unit("django-test.service")
        machine.succeed("curl localhost:8000")
    '';
})
