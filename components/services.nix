{ config, pkgs, lib, ... }:
{
  config = {
    # Syncthing
    services.syncthing = {
      enable = true;
      user = "lucas";
      dataDir = "/home/lucas";
      configDir = "/home/lucas/.config/syncthing";
    };

    # Enable Podman
    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = true;
      };
    };

    # Enable Virtualbox
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "lucas" ];


    # Enable printing
    # Enable CUPS to print documents.
    services.printing.enable = true;
    services.printing.drivers = [
      pkgs.gutenprint 
      pkgs.gutenprintBin
      pkgs.epson-escpr
    ];

    # Enable BTRFS monthly filesystem scrubbing
    # By default it does so monthly
    services.btrfs.autoScrub.enable = true;

    # Enable fstrim for NVMe driver
    # By default it does so weekly
    services.fstrim.enable = true;

    # Enable Firmware updates
    services.fwupd.enable = true;
  };
}