{ pkgs, ... }:

{
  systemd.services.starship-preset-updater = {
    description = "Update Starship pure preset configuration";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    serviceConfig = {
      Type = "oneshot";
      User = "plarpoon";
    };

    script = ''
      # Download pure preset and prepend command_timeout
      {
        echo "command_timeout = 10000"
        echo ""
        ${pkgs.curl}/bin/curl -fsSL https://starship.rs/presets/toml/pure-preset.toml
      } > $HOME/.config/starship.toml
    '';
  };

  systemd.timers.starship-preset-updater = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "2m";
      OnUnitActiveSec = "1h";
      Persistent = true;
    };
  };
}
