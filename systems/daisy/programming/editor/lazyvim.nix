{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    
    # LazyVim dependencies
    lazygit
    tree-sitter
    fzf
    ripgrep
    fd
  ];
}
