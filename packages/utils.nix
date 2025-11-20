{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mediawriter
  ];
}
