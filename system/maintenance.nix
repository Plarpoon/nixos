{ ... }:

{
  # Limit boot entries to 7 generations
  boot.loader.systemd-boot.configurationLimit = 7;

  # Automatically garbage collect old generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  # Firmware updates
  services.fwupd.enable = true;

  # AMD CPU microcode updates
  hardware.cpu.amd.updateMicrocode = true;
}
