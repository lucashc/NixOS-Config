{ config, pkgs, lib, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      # C/C++
      gcc
      # Python environment
      (pkgs.python39.withPackages (
        pythonpkgs: with pythonpkgs; [
          pip
          matplotlib
          numpy
          scipy
        ]
      ))
      # Go environment
      go
      # Julia environment
      julia-bin
      # Rust environment
      cargo
      rustc
    ];
  };
}