{ config, pkgs, lib, ... }:
{
  config = {
    # Nix options
    nix = {
      extraOptions = ''
        keep-outputs = true
        keep-derivations = true
      '';
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
  };
}