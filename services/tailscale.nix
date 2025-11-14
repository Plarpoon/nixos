{ ... }:

{
  networking.hostName = "daisy";

  services.tailscale = {
    enable = true;
    openFirewall = true;
  };
}
