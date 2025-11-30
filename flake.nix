{
  description = "daisy NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    {
      nixosConfigurations.daisy = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          ./filesystems
          ./nix-ld.nix
          ./packages
          ./programming
          ./services
          ./system
          ./systemd-units

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            home-manager.users.plarpoon = import ./home-manager;
          }
        ];
      };
    };
}
