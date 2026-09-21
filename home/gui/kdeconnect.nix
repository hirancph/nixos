{pkgs-unstable, ...}: {
  services.kdeconnect = {
    enable = true;
    indicator = true;
    package = pkgs-unstable.kdePackages.kdeconnect-kde;
  };
}
