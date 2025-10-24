{ pkgs, lib, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      general.import = [
        "~/.config/alacritty/themes/themes/challenger_deep.toml"
      ];

      env.TERM = "xterm-256color";

      font = {
        size = 12.0;
        normal.family = "FiraCode Nerd Font";
        bold.family = "FiraCode Nerd Font";
        italic.family = "FiraCode Nerd Font";
        bold_italic.family = "FiraCode Nerd Font";
      };

      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;

      terminal.shell = {
        program = "${pkgs.nushell}/bin/nu";
        args = [ "--login" ];
      };

      window = {
        dynamic_title = true;
        opacity = 1.0;
        dimensions = {
          columns = 150;
          lines = 40;
        };
      };
    };
  };

  # Clone alacritty themes repo
  home.activation.cloneAlacrittyThemes = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "$HOME/.config/alacritty/themes/.git" ]; then
      ${pkgs.git}/bin/git clone https://github.com/alacritty/alacritty-theme "$HOME/.config/alacritty/themes"
    else
      cd "$HOME/.config/alacritty/themes"
      ${pkgs.git}/bin/git pull
    fi
  '';
}
