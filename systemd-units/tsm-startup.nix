{ pkgs, ... }:

{
  systemd.user.services.tsm-application = {
    description = "TradeSkillMaster Application";
    after = [ "plasma-workspace.target" ];
    wants = [ "plasma-workspace.target" ];
    wantedBy = [ "plasma-workspace.target" ];

    serviceConfig = {
      Type = "simple";
      WorkingDirectory = "/home/plarpoon/.wine/drive_c/Program Files (x86)/TradeSkillMaster Application/app";
      ExecStart = "${pkgs.wineWowPackages.stable}/bin/wine tsmapplication.exe";
      Environment = "WINEPREFIX=/home/plarpoon/.wine";
      TimeoutStopSec = 5;
      KillMode = "mixed";
      KillSignal = "SIGTERM";
    };
  };
}
