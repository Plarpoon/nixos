{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
    htop
    tree
    nil
    gh
    alacritty
    starship
    direnv
    p7zip
    unrar
    lzop
    nixfmt-rfc-style
  ];
}
