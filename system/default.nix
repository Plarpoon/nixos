{ ... }:

{
  imports = [
    ./clamav.nix
    ./flake-lock-updater.nix
    ./hardware.nix
    ./kernel-parameters.nix
    ./locale.nix
    ./maintenance.nix
    ./network.nix
    ./nvd.nix
    ./users.nix
  ];
}
