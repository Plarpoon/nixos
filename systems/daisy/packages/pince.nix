{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pince
  ];
}
