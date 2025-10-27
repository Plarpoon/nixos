{ ... }:

{
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;

    settings = {
      command_timeout = 10000;
    };
  };
}
