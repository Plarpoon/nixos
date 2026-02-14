{ pkgs, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;

    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
    };
  };

  environment.systemPackages =
    (with pkgs.kdePackages; [
      partitionmanager
      plasma-firewall
      #kdeconnect-kde # iPhone fucking sucks man.
      kio-admin
      sweeper
    ])
    ++ (with pkgs; [
      # Spell checking
      hunspell
      hunspellDicts.en_US
      hunspellDicts.sv_SE
      hunspellDicts.it_IT
    ]);
}
