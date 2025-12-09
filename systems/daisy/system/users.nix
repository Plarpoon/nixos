{ pkgs, ... }:

{
  users.users.plarpoon = {
    isNormalUser = true;
    description = "Alessandro Suha";
    shell = pkgs.nushell;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  environment.shells = [ pkgs.nushell ];
}
