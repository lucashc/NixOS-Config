# Default system-wide python environment

pkgs: pkgs.python39.withPackages (
  ps: with ps; [
    matplotlib
    pytorch
    numpy
    scipy
    jupyter
    ipython
  ]
)