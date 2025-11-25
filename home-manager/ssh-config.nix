{ ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "lnu_gitlab" = {
        hostname = "gitlab.lnu.se";
        user = "git";
        identityFile = "~/.ssh/lnu_gitlab";
        identitiesOnly = true;
      };

      "*" = {
        user = "plarpoon";
        port = 22;
        forwardAgent = false;
        forwardX11 = false;
        compression = true;
      };
    };
  };
}
