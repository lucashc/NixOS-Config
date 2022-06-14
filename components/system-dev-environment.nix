{ config, pkgs, lib, ... }:
{
    config = {
        environment.systemPackages = with pkgs; [
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
        ];
    };
}