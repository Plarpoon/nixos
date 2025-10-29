{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;

    # shell aliases
    shellAliases = {
      neofetch = "fastfetch";
      cat = "bat --color=always";
      htop = "btm";
      ll = "ls -a";
      rwatch = "cargo watch -q -c -w src/ -x 'run -q'";
    };

    # config.nu
    # configFile.text = ''
    #   if ($env.TMUX? | is-empty) {
    #     try { ^tmux kill-session -t main } catch { }
    #     exec tmux new-session -s main
    #   }
    # '';

    # env.nu
    envFile.text = ''
      use std/util "path add"
      path add "~/.cargo/bin"

      # GPG
      $env.GIT_GPG_COMMAND = "gpg --pinentry-mode=loopback"
      $env.GPG_TTY = (tty)

      # Nushell
      $env.config.buffer_editor = "${pkgs.neovim}/bin/nvim"
      $env.config.show_banner = false
    '';
  };
}
