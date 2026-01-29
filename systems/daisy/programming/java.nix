{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zulu
    gradle
  ];

  environment.variables = {
    JAVA_HOME = "${pkgs.zulu}";
  };
}
