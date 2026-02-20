{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    samba
  ];
}
