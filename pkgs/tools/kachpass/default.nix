{ pass, keyctl, substituteAll, lib }:
let
  mkKachPass = { targetKeyring ? "@us", keyringType ? "user", keyringPrefix ? "pass" }:
  substituteAll {
    name = "kachpass";
    src = ./kachpass.sh;

    dir = "bin";
    isExecutable = true;

    inherit pass keyctl targetKeyring keyringType keyringPrefix;
    passthru.mkKachPass = mkKachPass;

    meta = with lib; {
      description = "Long-term caching of password-store provided password using kernel keyring";
      license = [ licenses.mit ];
      platforms = platforms.linux;
    };
  };
in
  mkKachPass {}
