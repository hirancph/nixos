{pkgs-unstable, ...}: {
    home.packages = with pkgs-unstable; [
      basedpyright
      ruff
    ];
  }
