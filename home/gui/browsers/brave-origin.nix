{ pkgs-unstable, ... }: {
  home.packages = with pkgs-unstable; [
    brave-origin
  ];
}
