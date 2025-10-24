{ pkgs, ... }:

{
  systemd.user.services.flake-lock-updater = {
    description = "Update NixOS flake.lock";

    serviceConfig = {
      Type = "oneshot";
      WorkingDirectory = "/home/plarpoon/nixos-config";
      ExecStart = "${pkgs.nix}/bin/nix flake update";
    };
  };

  systemd.user.timers.flake-lock-updater = {
    description = "Update flake.lock every hour";
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
    };
  };
}
