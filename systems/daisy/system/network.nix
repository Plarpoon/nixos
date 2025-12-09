{ ... }:

{
  networking.hostName = "daisy";
  networking.networkmanager.enable = true;

  # Uncomment if needed:
  # networking.wireless.enable = true;
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
