{ config, pkgs, ... }:

{
  imports = [
    ./console.nix
    ./browsers.nix
    ./editor.nix
    ./steam.nix
    ./wine.nix
  ];
}
