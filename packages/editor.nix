{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    vscode
    zed-editor

    # LazyVim dependencies
    lazygit
    tree-sitter
    fzf
    ripgrep
    fd
  ];
}
