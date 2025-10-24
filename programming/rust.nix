{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup
  ];

  environment.variables = {
    RUSTUP_HOME = "$HOME/.rustup";
    CARGO_HOME = "$HOME/.cargo";
  };
}
