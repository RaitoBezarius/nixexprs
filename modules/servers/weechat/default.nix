# Inspired by ncfavier's version.
{ config, pkgs, lib, ... }: 
with lib;
let
  cfg = config.services.tmux-weechat;
  weechat = pkgs.weechat.override {
  configure = { availablePlugins, ... }: {
    plugins = map (p: availablePlugins.${p}) cfg.plugins;
    init = "/exec -oc cat ${builtins.toFile "weechat-init" ''
      /set sec.crypt.passphrase_command "cat ${cfg.secretsPassphraseFile}"
      /set relay.network.bind_address ${cfg.relayBindAddress}
      /set relay.port.weechat ${toString relayPort}
      /set logger.file.path ${cfg.ircLogsPath}
      /script install ${builtins.concatStringsSep " " cfg.scripts}
    ''}";
  };
};

in
  {
    options.services.tmux-weechat = {
      enable = mkEnableOption "WeeChat in a tmux";
      package = mkOption {
        default = pkgs.weechat;
        type = types.package;
      };
      plugins = mkOption {
        description = "List of WeeChat plugins in the set of available plugins for a given package.";
        type = types.listOf types.str;
        default = [ "python" "perl" ];
      };
      scripts = mkOption {
        description = "List of WeeChat scripts, which are installed in the initialization script.";
        type = types.listOf types.str;
        default = [
          "color_popup.pl"
          "highmon.pl"
          "perlexec.pl"
          "autojoin.py"
          "autosort.py"
          "buffer_autoset.py"
          "colorize_nicks.py"
          "go.py"
          "screen_away.py"
          "title.py"
        ];
      };
      relayPort = mkOption {
        default = 50340;
        type = types.port;
      };
      relayBindAddress = mkOption {
        default = "::/0";
        type = types.str;
      };
      ircLogsPath = mkOption {
        default = "${cfg.user}/.weechat/logs";
        type = types.str;
      };
      user = mkOption {
        type = types.str;
        description = "User for the weechat session";
      };
      secretsPassphraseFile = mkOption {
        type = types.str;
        description = "File containing the passphrase to unlock Weechat secrets";
      };
    };
  config = lib.mkIf cfg.enable {
    systemd.services.tmux-weechat = {
      description = "WeeChat in a tmux session";
      wants = [ "network-online.target" ];
      after = [ "network-online.target" "nss-lookup.target" ];
      serviceConfig = {
        Type = "forking";
        User = cfg.user;
        ReadWritePaths = [ ${cfg.ircLogsPath} ]; # Can read/write IRC logs.
        ExecStart     = "${pkgs.tmux}/bin/tmux -L weechat new-session -s weechat -d ${pkgs.zsh}/bin/zsh -lc 'exec ${weechat}/bin/weechat'";
        ExecStartPost = "${pkgs.tmux}/bin/tmux -L weechat set-option status off \\; set-option mouse off";
      };
      wantedBy = [ "multi-user.target" ];
    };

    networking.firewall.allowedTCPPorts = [ cfg.relayPort ];

    nixpkgs.overlays = [
      (self: super: {
        weechat-unwrapped = super.weechat-unwrapped.overrideAttrs ({ patches ? [], ... }: {
          patches = patches ++ [
            (builtins.toFile "weechat-patch" ''
              Avoid reloading configuration on SIGHUP (https://github.com/weechat/weechat/issues/1595)
              --- a/src/core/weechat.c
              +++ b/src/core/weechat.c
              @@ -698 +698 @@ weechat_sighup ()
              -    weechat_reload_signal = SIGHUP;
              +    weechat_quit_signal = SIGHUP;
            '')
          ];
        });
      })
    ];
  };
}
