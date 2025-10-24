{ config, pkgs, ... }:

{
  imports = [
    ./appimage.nix
    ./docker.nix
    ./flatpak.nix
    ./kde.nix
    ./ssh.nix
  ];
}
