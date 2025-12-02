{ pkgs, ... }:

let
  targetUser = "plarpoon";
in
{
  systemd.services.rustup-updater = {
    description = "Update Rust toolchains and cargo packages";

    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    path = [
      pkgs.cargo-update
      pkgs.cargo
      pkgs.rustup
      pkgs.curl
    ];

    serviceConfig = {
      Type = "oneshot";
      User = targetUser;
      Environment = "HOME=/home/${targetUser}";
    };

    script = ''
      # Quick network check
      if ! ${pkgs.curl}/bin/curl -s --connect-timeout 2 https://github.com > /dev/null 2>&1; then
        echo "Network unavailable, skipping Rust update"
        exit 0
      fi

      ${pkgs.rustup}/bin/rustup update && ${pkgs.cargo-update}/bin/cargo install-update -a
    '';
  };

  systemd.timers.rustup-updater = {
    description = "Update Rust toolchains and cargo packages daily";
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      RandomizedDelaySec = "10m";
    };
  };
}
