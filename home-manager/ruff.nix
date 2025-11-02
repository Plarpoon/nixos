{ ... }:

{
  programs.ruff = {
    enable = true;

    settings = {
      line-length = 120;
      target-version = "py3";

      lint = {
        select = [ "ALL" ];
        ignore = [
          "T201" # Allow print statements
          "D" # Disable all docstring rules
          "COM812" # Disable trailing comma rule
          "ANN401" # Disallow dynamically typed types
        ];

        pylint = {
          allow-magic-value-types = [ ];
        };
      };
    };
  };
}
