{
  description = "daisy central NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    {
      nixosConfigurations.daisy = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          ./nix-ld.nix
          ./packages
          ./services
          ./programming
          ./filesystems
          ./systemd-units
          ./system

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.plarpoon = import ./home-manager;
          }
        ];
      };
    };
}
