{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    glab
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      extraFlags = [ "--force" ];
    };

    casks = [
      "librewolf"
      "jellyfin-media-player"
      "maccy"
      "dbeaver-community"
      "postgres-app"
      "krita"
      "obsidian"
      "netbirdio/tap/netbird-ui"
      "vorssaint"
    ];

    brews = [
      "direnv"
      "libdpp"
      "croc"
      "chezmoi"
    ];
  };

  environment.variables = {
    HOMEBREW_NO_AUTO_UPDATE = "1";
  };
}
