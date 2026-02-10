{ pkgs, ... }:

let
  targetUser = "plarpoon";
  configPath = "/home/${targetUser}/nixos-config";

  updateScript = pkgs.writeShellScript "update-readme-badges" ''
    set -e

    cd ${configPath}

    NIXOS_VERSION=$(grep -oP 'nixpkgs\.url.*nixos-\K[\d.]+' flake.nix | head -1)
    LAST_REBUILT=$(date +"%Y--%m--%d")

    # Count packages in current system
    PACKAGE_COUNT=$(${pkgs.nix}/bin/nix-store --query --requisites /run/current-system 2>/dev/null | wc -l || echo "calculating...")

    # Update README.md badges
    ${pkgs.gnused}/bin/sed -i \
      -e "s|!\[NixOS Version\](.*)|![NixOS Version](https://img.shields.io/badge/NixOS-$NIXOS_VERSION-blue?logo=nixos\&logoColor=white)|" \
      -e "s|!\[Last Rebuilt\](.*)|![Last Rebuilt](https://img.shields.io/badge/Last_Rebuilt-$LAST_REBUILT-green)|" \
      -e "s|!\[Package Count\](.*)|![Package Count](https://img.shields.io/badge/Packages-$PACKAGE_COUNT-orange)|" \
      readme.md

    echo "readme of nixos-config badges updated: NixOS $NIXOS_VERSION, $PACKAGE_COUNT packages, rebuilt $LAST_REBUILT"
  '';
in
{
  systemd.services.readme-badge-updater = {
    description = "Update README.md badges after system rebuild";

    after = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      User = targetUser;
      WorkingDirectory = configPath;
      ExecStart = "${updateScript}";
    };
  };

  # Trigger on system activation
  system.activationScripts.updateReadmeBadges = ''
    # Run badge updater in background after activation
    ${pkgs.systemd}/bin/systemctl start readme-badge-updater.service || true
  '';
}
