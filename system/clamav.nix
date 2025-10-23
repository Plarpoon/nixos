{ config, pkgs, ... }:

{
  # ClamAV antivirus
  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
  };

  # Install ClamAV and ClamTk (GUI)
  environment.systemPackages = with pkgs; [
    clamav
    clamtk
  ];
}
