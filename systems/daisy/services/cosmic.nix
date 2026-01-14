{ ... }:

{
  # Enable COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

  # Enable Cosmic Greeter
  # Currently disabled as I am using SDDM
  # services.displayManager.cosmic-greeter.enable = true;

  # System76 scheduler
  # Disabled as it would interfere with KDE's power management
  # services.system76-scheduler.enable = true;

  # COSMIC-specific packages
  # environment.systemPackages = with pkgs; [
  #  ...
  # ];
}
