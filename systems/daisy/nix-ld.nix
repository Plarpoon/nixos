{ pkgs, ... }:

{
  programs.nix-ld = {
    # Enable nix-ld for running non-NixOS executables
    enable = true;
    libraries = with pkgs; [
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
  };
}
