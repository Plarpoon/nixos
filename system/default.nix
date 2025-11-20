{ ... }:

{
  imports = [
    ./clamav.nix
    ./fonts.nix
    ./flake-lock-updater.nix
    ./hardware.nix
    ./kernel-parameters.nix
    ./locale.nix
    ./maintenance.nix
    ./network.nix
    ./nvd.nix
    ./printer.nix
    ./users.nix
    ./systemd-resolved.nix
  ];
}
