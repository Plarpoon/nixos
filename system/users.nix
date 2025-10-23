{ config, pkgs, ... }:

{
  users.users.plarpoon = {
    isNormalUser = true;
    description = "Alessandro Suha";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
  };
}
