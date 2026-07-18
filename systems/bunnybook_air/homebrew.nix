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

    taps = [
      "netbirdio/tap"
    ];

    casks = [
      "librewolf"
      "jellyfin-media-player"
      "maccy"
      "dbeaver-community"
      "postgres-app"
      "krita"
      "netbirdio/tap/netbird-ui"
    ];

    brews = [
      "direnv"
      "libdpp"
    ];
  };

  environment.variables = {
    HOMEBREW_NO_AUTO_UPDATE = "1";
  };
}
