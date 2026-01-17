{ pkgs, ... }:

{
  systemd.user.services.tsm-application = {
    description = "TradeSkillMaster Application";

    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "simple";
      WorkingDirectory = "/home/plarpoon/.wine/drive_c/Program Files/TradeSkillMaster Application/app";
      Environment = "WINEPREFIX=/home/plarpoon/.wine";
      TimeoutStopSec = 5;
      KillMode = "mixed";
      KillSignal = "SIGTERM";
      Restart = "on-failure";
      RestartSec = "10s";
    };

    script = ''
      if ! ${pkgs.curl}/bin/curl -s --connect-timeout 2 https://tradeskillmaster.com/ > /dev/null 2>&1; then
        echo "Network unavailable, skipping TSM startup"
        exit 0
      fi

      exec ${pkgs.winePackages.staging}/bin/wine TSMApplication.exe
    '';
  };
}
