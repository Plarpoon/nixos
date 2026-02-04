{ pkgs, ... }:

{
  # Kernel version
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Limit boot entries to 7 generations
  boot.loader.systemd-boot.configurationLimit = 7;

  # Automatically garbage collect old generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  services.fwupd.enable = true;

  hardware = {
    enableRedistributableFirmware = true;
    cpu.amd.updateMicrocode = true;

    amdgpu = {
      initrd.enable = true; # Loads amdgpu driver early in boot
      opencl.enable = true;
    };

    # Graphics support
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };
  };
}
