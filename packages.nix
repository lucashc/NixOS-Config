# Packages to install systemwide

pkgs: with pkgs; [
# Command-line utilities
    vim
    wget
    fish
    git
    gcc
# Python environment
    (import ./python.nix pkgs)
# Graphical programs
    firefox-wayland
    vscode
    jetbrains.pycharm-community
    zim
    xournalpp
# Gnome specific
    gnome.gnome-terminal
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
    gnome.gedit
    stretchly
]