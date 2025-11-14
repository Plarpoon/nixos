{ pkgs, ... }:

{
  # Enable nix-ld for running non-NixOS executables
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Wayland
    wayland
    libxkbcommon
    libdecor

    # Vulkan/OpenGL
    libGL
    libglvnd
    vulkan-loader

    # Audio
    pipewire
    libpulseaudio
    alsa-lib
  ];
}
