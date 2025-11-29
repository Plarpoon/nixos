{ pkgs, ... }:

# you need to run at least once "rustup default stable" to set a default toolchain

{
  systemd.user.services.rustup-updater = {
    description = "Update Rust toolchains and cargo packages";

    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    path = [
      pkgs.cargo-update
      pkgs.cargo
    ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.rustup}/bin/rustup update && cargo install-update -a'";
    };
  };

  systemd.user.timers.rustup-updater = {
    description = "Update Rust toolchains and cargo packages daily";
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };
}
