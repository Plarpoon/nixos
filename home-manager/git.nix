{ config, pkgs, ... }:

{
  programs.git.settings.user = {
    enable = true;
    name = "Alessandro Suha";
    email = "github@plarp.net";

    signing = {
      key = "B32EE4AA9247F217";
      signByDefault = true;
    };
  };
}
