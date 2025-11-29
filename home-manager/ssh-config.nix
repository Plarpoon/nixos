{
  config,
  lib,
  ...
}:

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
        forwardAgent = false;
        forwardX11 = false;
        compression = true;
      };
    };
  };

  # Copy SSH config instead of symlinking
  # So the permissions and ownership will not be wrong
  home.activation.copySshConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -L "$HOME/.ssh/config" ]; then
      rm "$HOME/.ssh/config"
    fi

    # Copy from the generated config
    cp ${config.home.file.".ssh/config".source} $HOME/.ssh/config
    chmod 600 $HOME/.ssh/config
  '';
}
