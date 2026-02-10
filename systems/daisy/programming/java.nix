{ pkgs, ... }:

{
  # Latest in stable nixpkgs channel,
  # will lag beehind until next stable is out.
  environment = {
    systemPackages = with pkgs; [
      (jdk.override { enableJavaFX = true; })
      gradle
    ];

    variables = {
      JAVA_HOME = "${pkgs.jdk.override { enableJavaFX = true; }}";
    };
  };
}
