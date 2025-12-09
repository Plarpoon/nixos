{
  description = "Multi-platform Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }:
    let
      lib = import ./systems/lib.nix { inherit nixpkgs nix-darwin home-manager; };
    in
    {
      nixosConfigurations = {
        daisy = lib.mkNixOS {
          hostname = "daisy";
          system = "x86_64-linux";
          username = "plarpoon";
        };
      };

      darwinConfigurations = {
        bunnybook_air = lib.mkDarwin {
          hostname = "bunnybook_air";
          system = "aarch64-darwin";
          username = "plarpoon";
        };
      };
    };
}
