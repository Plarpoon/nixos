{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./network.nix
    ./locale.nix
    ./users.nix
    ./clamav.nix
    ./maintenance.nix
    ./flake-lock-updater.nix
    ./kernel-parameters.nix
  ];
}
