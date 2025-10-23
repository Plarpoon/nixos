{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Alessandro Suha";
    userEmail = "github@plarp.net";

    signing = {
      key = "B32EE4AA9247F217";
      signByDefault = true;
    };
  };
}
