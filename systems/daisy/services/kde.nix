{ pkgs, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.partitionmanager
    #kdePackages.kdeconnect-kde # iPhone fucking sucks man.
    kdePackages.kio-admin
    kdePackages.sweeper

    # Spell checking
    hunspell
    hunspellDicts.en_US
    hunspellDicts.sv_SE
    hunspellDicts.it_IT
  ];
}
