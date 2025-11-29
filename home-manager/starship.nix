{ pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = { };
  };

  home.activation.downloadStarshipPreset = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -L "$HOME/.config/starship.toml" ]; then
      rm "$HOME/.config/starship.toml"
    fi

    # Download preset
    ${pkgs.curl}/bin/curl -L -o $HOME/.config/starship.toml.tmp https://starship.rs/presets/toml/pure-preset.toml

    # Add command_timeout at the TOP, then append the preset
    echo "command_timeout = 10000" > $HOME/.config/starship.toml
    echo "" >> $HOME/.config/starship.toml
    cat $HOME/.config/starship.toml.tmp >> $HOME/.config/starship.toml
    rm $HOME/.config/starship.toml.tmp
  '';
}
