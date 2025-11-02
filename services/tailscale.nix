{ ... }:

{
  services.tailscale = {
    enable = true;
    #useRoutingFeatures = "both"; # Enable subnet routing and exit node
    openFirewall = true;
  };
}
