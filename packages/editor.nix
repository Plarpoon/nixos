{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    vscode
    zed-editor
  ];
}
