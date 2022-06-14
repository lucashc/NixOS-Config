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

        # Enable printing
        # Enable CUPS to print documents.
        services.printing.enable = true;
    };
}