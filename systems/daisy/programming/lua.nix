{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lua
    luaPackages.luacheck
  ];
}
