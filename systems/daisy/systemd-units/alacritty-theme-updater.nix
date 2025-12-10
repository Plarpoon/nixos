{ pkgs, ... }:

{
  systemd.services.alacritty-theme-updater = {
    description = "Update Alacritty themes repository";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    serviceConfig = {
      Type = "oneshot";
      User = "plarpoon";
    };

    script = ''
      THEMES_DIR="$HOME/.config/alacritty/themes"

      if [ ! -d "$THEMES_DIR/.git" ]; then
        # Clone if doesn't exist
        ${pkgs.git}/bin/git clone https://github.com/alacritty/alacritty-theme "$THEMES_DIR"
      else
        # Update if exists
        cd "$THEMES_DIR"
        ${pkgs.git}/bin/git pull
      fi
    '';
  };

  systemd.timers.alacritty-theme-updater = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "2m";
      OnUnitActiveSec = "1h";
      Persistent = true;
    };
  };
}
