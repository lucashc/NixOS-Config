{ config, pkgs, lib, ... }:
{
  config = {
    users.users.lucas.shell = pkgs.zsh;
    environment.systemPackages = with pkgs; [
      # Command-line utilities
      vim
      wget
      tig
      git
      tree
      nmap
      htop btop
      file
      neofetch
    ];
    programs.zsh = {
      enable = true;
      enableBashCompletion = true;
      ohMyZsh = {
        enable = true;
        theme = "gnzh";
        plugins = [ "git" "wd" ];
      };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };
}