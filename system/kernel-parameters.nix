{ ... }:

{
  boot.kernelParams = [
    "pcie_aspm=off"
    "amdgpu.gpu_recovery=1"
  ];
}
