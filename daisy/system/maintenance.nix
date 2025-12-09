{ pkgs, ... }:

{
  # Limit boot entries to 7 generations
  boot.loader.systemd-boot.configurationLimit = 7;

  # Kernel version
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Automatically garbage collect old generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  services.fwupd.enable = true;
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;

  hardware.amdgpu = {
    initrd.enable = true; # Load amdgpu driver early in boot
    opencl.enable = true;
  };

  # Graphics support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

}
