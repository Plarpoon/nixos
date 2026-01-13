{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Compression
    lzop
    p7zip
    unrar
    unzip

    # Development Tools
    clang
    clippy
    direnv
    file
    gcc
    gh
    git
    gnumake
    openssl
    statix

    # Nix
    nil
    nixfmt-rfc-style
    nix-index

    # Shell
    alacritty
    fastfetch
    starship

    # System Utilities
    bat
    btop
    curl
    ethtool
    tree
    sysfsutils
    pciutils
    jq
    wget
    nmap
  ];
}
