{ pkgs, ... }:

{
  programs.system-config-printer.enable = true;

  environment.systemPackages = with pkgs; [
    system-config-printer
  ];

  users.users.plarpoon.extraGroups = [
    "lp"
    "scanner"
  ];

  services.printing = {
    enable = true;
    drivers = [
      pkgs.gutenprint
      pkgs.hplipWithPlugin
      pkgs.brlaser
      pkgs.epson-escpr2
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  hardware.sane = {
    enable = true;
    extraBackends = [
      pkgs.hplipWithPlugin
      pkgs.sane-airscan
    ];
  };
}
