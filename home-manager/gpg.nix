{ config, pkgs, ... }:

{
  programs.gpg = {
    enable = true;
    settings = {
      default-key = "B32EE4AA9247F217";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-qt;
  };
}
