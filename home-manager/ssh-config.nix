{ ... }:

{
  programs.ssh = {
    enable = true;

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
      };
    };
  };
}
