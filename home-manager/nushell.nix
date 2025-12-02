{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;

    # shell aliases
    shellAliases = {
      neofetch = "fastfetch";
      cat = "bat --color=always";
      htop = "btop";
      ll = "ls -a";
      rwatch = "cargo watch -q -c -w src/ -x 'run -q'";

      # NixOS
      nixos-switch = "sudo nixos-rebuild switch --flake ~/nixos-config#daisy";
      nixos-boot = "sudo nixos-rebuild boot --flake ~/nixos-config#daisy";
      nixos-dry = "sudo nixos-rebuild dry-build --flake ~/nixos-config#daisy";
    };

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
