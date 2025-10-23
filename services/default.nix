{ config, pkgs, ... }:

{
  imports = [
    ./kde.nix
    ./flatpak.nix
    ./docker.nix
    ./ssh.nix
    ./appimage.nix
  ];
}
