{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Compression
    lzop
    p7zip
    unrar

    # Development Tools
    clang
    clippy
    direnv
    gcc
    gh
    git
    openssl
    tmux

    # Fonts
    nerd-fonts.fira-code

    # Nix
    nil
    nixfmt-rfc-style

    # Shell
    alacritty
    starship

    # System Utilities
    btop
    curl
    tree
    wget
  ];
}
