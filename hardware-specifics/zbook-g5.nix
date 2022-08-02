{ config, pkgs, lib, ... }:
{
  config = {
    # Enable proper sound
    hardware.firmware = [
      (
        pkgs.runCommandNoCC "hda-jack-retask" { } ''
        mkdir -p $out/lib/firmware/
        cp ${./hda-jack-retask.fw} $out/lib/firmware/hda-jack-retask.fw
        ''
      )
    ];
    # Graphics card config
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.modesetting.enable = true;
    services.switcherooControl.enable = true;

    # Enable OpenGL and hardware acceleration
    hardware.opengl = {
      enable = true;
      extraPackages = with pkgs; [
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
}