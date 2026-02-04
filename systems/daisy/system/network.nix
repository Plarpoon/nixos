{ ... }:

{
  networking = {
    hostName = "daisy";
    networkmanager.enable = true;

    # Uncomment if needed:
    # wireless.enable = true;
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
