{ config, pkgs, lib, ... }:
{
  config = {
    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
        libinput.enable = true;
        wacom.enable = true;
    };

    environment.gnome.excludePackages = with pkgs; [
        gnome.totem
        gnome-console
        gnome-tour
        epiphany
        gnome.geary
    ];

    services.gnome.gnome-initial-setup.enable = false;

    environment.systemPackages = with pkgs; [
        gnome.gnome-terminal
        gnome.gnome-todo
        gnomeExtensions.caffeine
        gnomeExtensions.appindicator
        gnome.gedit
        gnome.gnome-boxes
        vlc
    ];
  };
}