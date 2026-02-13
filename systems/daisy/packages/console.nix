{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Compression
    lzop
    p7zip
    unrar
    unzip
    unar
    zip

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
    web-ext
    minify

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
    dig
    ethtool
    tree
    sysfsutils
    pciutils
    jq
    wget
    nmap
  ];
}
