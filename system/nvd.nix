{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.nvd ];

  system.activationScripts.diff = {
    supportsDryActivation = true;
    text = ''
      if [[ -e /run/current-system ]]; then
        ${pkgs.nvd}/bin/nvd diff /run/current-system "$systemConfig"
      fi
    '';
  };
}
