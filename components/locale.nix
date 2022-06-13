{ config, pkgs, lib, ... }:
{
  config = {
    # Set your time zone.
    time.timeZone = "Europe/Amsterdam";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_GB.utf8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "nl_NL.utf8";
      LC_IDENTIFICATION = "nl_NL.utf8";
      LC_MEASUREMENT = "nl_NL.utf8";
      LC_MONETARY = "nl_NL.utf8";
      LC_NAME = "nl_NL.utf8";
      LC_NUMERIC = "nl_NL.utf8";
      LC_PAPER = "nl_NL.utf8";
      LC_TELEPHONE = "nl_NL.utf8";
      LC_TIME = "nl_NL.utf8";
    };

    # Configure keymap in X11
    services.xserver = {
      layout = "us";
      xkbVariant = "intl";
    };

    # Configure console keymap
    console.keyMap = "us-acentos";
  };
}