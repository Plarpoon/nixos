{ ... }:

{
  boot.loader.grub = {
    enable = true;
    device = "nodev"; # for UEFI
    efiSupport = true;
    useOSProber = true;
  };
}
