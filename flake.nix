{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      mkSystem =
        {
          hostname,
          system,
          username,
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit hostname username;
          };

          modules = [
            ./${hostname}

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              home-manager.users.${username} = import ./${hostname}/home-manager;
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        daisy = mkSystem {
          hostname = "daisy";
          system = "x86_64-linux";
          username = "plarpoon";
        };

        bruno = mkSystem {
          hostname = "bunnybook_air";
          system = "aarch64-linux";
          username = "plarpoon";
        };
      };
    };
}
