{ ... }:

{
  imports = [
    ./flake-lock-updater.nix
    ./rust-updater.nix
    ./tsm-startup.nix
    ./nixos-release-notifier.nix
  ];
}
