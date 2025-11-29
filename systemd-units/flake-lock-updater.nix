{ pkgs, ... }:

let
  gitUser = "Flake Updater";
  gitEmail = "flake-updater@localhost";
in
{
  systemd.user.services.flake-lock-updater = {
    description = "Update NixOS flake.lock";

    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    serviceConfig = {
      Type = "oneshot";
      WorkingDirectory = "/home/plarpoon/nixos-config";
    };

    environment = {
      GIT_AUTHOR_NAME = gitUser;
      GIT_AUTHOR_EMAIL = gitEmail;
      GIT_COMMITTER_NAME = gitUser;
      GIT_COMMITTER_EMAIL = gitEmail;
    };

    script = ''
      ${pkgs.nix}/bin/nix flake update --commit-lock-file
    '';
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
