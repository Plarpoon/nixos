{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Nix
    nixd
    nixfmt-rfc-style
    nix-index
    statix

    # Shell
    alacritty
    fastfetch
    starship

    # Useful garbage
    fzf
    tmux
    neovim
    lazygit
    ripgrep
    fd

    # Compression
    lzop
    p7zip
    unrar
    unzip
    unar
    zip

    # Development Tools
    gh
    cmake
    android-tools

    # System Utilities
    bat
    btop
    fastfetch
  ];
}
