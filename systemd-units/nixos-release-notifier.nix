{ pkgs, ... }:

let
  configPath = "~/nixos-config";
in
{
  systemd.user.services.nixos-release-notifier = {
    description = "Check for new NixOS releases";

    after = [
      "graphical-session.target"
      "network-online.target"
    ];
    wants = [ "network-online.target" ];

    script = ''
      # Get current version from flake.lock
      CURRENT=$(${pkgs.jq}/bin/jq -r '.nodes.nixpkgs.original.ref' ${configPath}/flake.lock | sed 's/nixos-//')

      # Get latest stable release tag (format: XX.XX, no pre/beta/branch-off)
      LATEST=$(${pkgs.curl}/bin/curl -s "https://api.github.com/repos/NixOS/nixpkgs/tags?per_page=50" \
        | ${pkgs.jq}/bin/jq -r '.[].name' \
        | ${pkgs.gnugrep}/bin/grep -E '^[0-9]+\.[0-9]+$' \
        | ${pkgs.coreutils}/bin/head -n 1)

      if [ -n "$LATEST" ] && [ "$LATEST" != "$CURRENT" ]; then
        ${pkgs.libnotify}/bin/notify-send -u critical "NixOS Update Available!" "New version $LATEST is available (you're on $CURRENT)"
      fi
    '';
  };

  systemd.user.timers.nixos-release-notifier = {
    description = "Check for NixOS releases every 15 minutes";
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "*:0/15";
      Persistent = true;
    };
  };
}
