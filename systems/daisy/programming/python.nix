{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (
      ps: with ps; [
        pip
        virtualenv

        # Analysis tools
        pylint
        vulture

        # Libraries
        matplotlib
      ]
    ))

    # Standalone tools
    ruff
    conda
  ];
}
