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
    configFile.text = ''
      # Auto-start tmux - attach to 'main' or create it
      if ($env.TMUX? | is-empty) {
          exec tmux new-session -A -s main
      }
    '';

    # env.nu
    envFile.text = ''
      use std/util "path add"
      path add "~/.cargo/bin"

      # Starship
      mkdir ($nu.data-dir | path join "vendor/autoload")
      starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
      use ~/.cache/starship/init.nu
      starship config command_timeout 10000

      # GPG
      $env.GIT_GPG_COMMAND = "gpg --pinentry-mode=loopback"
      $env.GPG_TTY = (tty)

      # Nushell
      $env.config.buffer_editor = "${pkgs.neovim}/bin/nvim"
      $env.config.show_banner = false
    '';
  };
}
