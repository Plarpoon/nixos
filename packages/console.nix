{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Compression
    lzop
    p7zip
    unrar

    # Development Tools
    direnv
    gh
    tmux

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
