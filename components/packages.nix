{ config, pkgs, lib, ... }:
{
    config = {
        environment.systemPackages = with pkgs; [
            # Command-line utilities
            vim
            wget
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
            zotero
            # BTRFS tools
            compsize
        ];
        # Steam
        programs.steam.enable = true;
        # Some programs need SUID wrappers, can be configured further or are
        # started in user sessions.
        programs.mtr.enable = true;
        programs.gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
        };
        # Enable wireshark
        programs.wireshark = {
            enable = true;
            package = pkgs.wireshark-qt;
        };
    };
}