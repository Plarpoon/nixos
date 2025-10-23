{ config, pkgs, ... }:

{
  boot.kernelParams = [
    "pcie_aspm=off"
  ];
}
