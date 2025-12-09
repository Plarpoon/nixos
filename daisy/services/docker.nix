{ pkgs, ... }:

{
  # Enable Docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "daily";
    };
  };

  # Add plarpoon to docker group for sudo-less docker commands
  users.users.plarpoon.extraGroups = [ "docker" ];

  # Install Docker Compose
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
