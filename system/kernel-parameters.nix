{ ... }:

{
  boot.kernelParams = [
    "pcie_aspm=off"
    "pcie_aspm.policy=performance"
    "amdgpu.gpu_recovery=1"
  ];
}
