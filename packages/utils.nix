{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mediawriter
    mullvad
    mullvad-vpn
  ];
}
