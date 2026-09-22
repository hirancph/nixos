{pkgs-unstable, ...}: {
    home.packages = with pkgs-unstable; [
      nixd
      nixfmt
    ];
  }
