{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      zulu
      gradle
    ];

    variables = {
      JAVA_HOME = "${pkgs.zulu}";
    };
  };
}
