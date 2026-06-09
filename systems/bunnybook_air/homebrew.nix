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
      cleanup = "zap";
      extraFlags = [ "--force" ];
    };

    casks = [
      "librewolf"
      "jellyfin-media-player"
      "maccy"
      "dbeaver-community"
      "postgres-app"
      "krita"
    ];

    brews = [
      "direnv"
    ];
  };

  environment.variables = {
    HOMEBREW_NO_AUTO_UPDATE = "1";
  };
}
