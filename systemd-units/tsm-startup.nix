{ pkgs, ... }:

{
  systemd.user.services.tsm-application = {
    description = "TradeSkillMaster Application";

    after = [
      "graphical-session.target"
      "network-online.target"
    ];
    wants = [ "network-online.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "simple";
      WorkingDirectory = "/home/plarpoon/.wine/drive_c/Program Files (x86)/TradeSkillMaster Application/app";
      ExecStart = "${pkgs.wineWowPackages.stable}/bin/wine tsmapplication.exe";
      Environment = "WINEPREFIX=/home/plarpoon/.wine";
      TimeoutStopSec = 5;
      KillMode = "mixed";
      KillSignal = "SIGTERM";
      Restart = "on-failure";
      RestartSec = "10s";
    };
  };
}
