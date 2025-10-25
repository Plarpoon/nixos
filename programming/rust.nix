{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup
    cargo-update
  ];

  environment.variables = {
    RUSTUP_HOME = "$HOME/.rustup";
    CARGO_HOME = "$HOME/.cargo";
  };
}
