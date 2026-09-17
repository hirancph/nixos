{pkgs-unstable, ...}: {
    programs.vesktop = {
      enable = true;
      package = pkgs-unstable.vesktop;
      };
  }
