{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python3

    python3Packages.pylint
    python3Packages.vulture
    ruff
  ];
}
