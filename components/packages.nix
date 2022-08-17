{ config, pkgs, lib, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      # Desktop applications
      firefox-wayland                 # Webbrowser
      vscode                          # IDE
      jetbrains.pycharm-community     # IDE
      zim                             # Personal Wiki
      xournalpp                       # PDF draw
      zoom-us                         # Conferencing
      stretchly                       # Break timer
      libreoffice                     # Office suite
      gimp inkscape                   # Image/vector editing
      zotero                          # Citation management
      signal-desktop                  # Instant messaging
      spotify                         # Music player
      texstudio                       # Editing latex
      texlive.combined.scheme-medium  # Latex suite

      # CLI applications
      rclone restic                   # Backup utils
      usbutils pciutils               # Device utilities
      psmisc                          # Miscellaneous system utilities
    ];
    # Steam
    programs.steam.enable = true;
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
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