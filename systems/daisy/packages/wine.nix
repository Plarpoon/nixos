{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    winePackages.staging
    winePackages.waylandFull
    winetricks
  ];
}
