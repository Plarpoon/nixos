{ pkgs, ... }:

{
  systemd.services.nixos-store-verify = {
    description = "Verify and repair Nix store integrity";

    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];

    serviceConfig = {
      Type = "oneshot";
      Nice = 19;
      IOSchedulingClass = "idle";

      # Prevent system shutdown while running
      # System will wait for verification to complete before shutting down
      TimeoutStopSec = "infinity";
    };

    script = ''
      echo "Starting Nix store verification and repair..."
      ${pkgs.nix}/bin/nix-store --verify --check-contents --repair
      echo "Nix store verification completed"
    '';
  };

  systemd.timers.nixos-store-verify = {
    description = "Verify Nix store daily";
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };
}
