{ config, pkgs, lib, ... }:
{
    config = {
        environment.systemPackages = with pkgs; [
            # Command-line utilities
            vim
            wget
            fish
            # Graphical programs
            firefox-wayland
            vscode
            jetbrains.pycharm-community
            zim
            xournalpp
            zoom-us
            stretchly
            libreoffice
            gimp inkscape
        ];
    };
}