{ config, pkgs, ... }:

{
  imports = [
    ./home.nix
    ./git.nix
    ./starship.nix
    ./alacritty.nix
    ./nushell.nix
    ./gpg.nix
  ];
}
