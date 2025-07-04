{ pass, keyutils, replaceVarsWith, runtimeShell, lib }:
let
  mkKachPass = { targetKeyring ? "@us", keyringType ? "user", keyringPrefix ? "pass" }:
  replaceVarsWith {
    name = "kachpass";
    src = ./kachpass.sh;

    dir = "bin";
    isExecutable = true;

    replacements = {
      shell = runtimeShell;
      inherit pass keyutils targetKeyring keyringType keyringPrefix;
    };
    passthru.mkKachPass = mkKachPass;

    meta = with lib; {
      description = "Long-term caching of password-store provided password using kernel keyring";
      license = [ licenses.mit ];
      platforms = platforms.linux;
    };
  };
in
  mkKachPass {}
