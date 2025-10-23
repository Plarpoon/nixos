{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wineWowPackages.staging
    wineWowPackages.waylandFull
    winetricks
  ];
}
