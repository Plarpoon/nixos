{ pkgs, ... }:

let
  targetUser = "plarpoon";
  gitUser = "Flake Updater";
  gitEmail = "flake-updater@localhost";
in
{
  systemd.services.flake-lock-updater = {
    description = "Update NixOS flake.lock";

    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];

    serviceConfig = {
      Type = "oneshot";
      User = targetUser;
      WorkingDirectory = "/home/${targetUser}/nixos-config";
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

  systemd.timers.flake-lock-updater = {
    description = "Update flake.lock every hour";
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
    };
  };
}
