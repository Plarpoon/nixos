{ ... }:

{
  imports = [
    ./go.nix
    ./python.nix
    ./rust.nix
    ./nodejs.nix
    ./lua.nix

    ./editor
  ];
}
