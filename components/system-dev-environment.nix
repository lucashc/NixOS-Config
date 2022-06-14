{ config, pkgs, lib, ... }:
{
    config = {
        environment.systemPackages = with pkgs; [
            # General dev utils
            git
            gcc
            # Python environment
            (pkgs.python39.withPackages (
                pythonpkgs: with pythonpkgs; [
                    matplotlib
                    pytorch
                    numpy
                    scipy
                    jupyter
                    ipython
                ]
            ))
            # Go environment
            go
            # Julia environment
            julia-bin
        ];
    };
}