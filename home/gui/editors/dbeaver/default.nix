{ pkgs-unstable, ... }: {
  programs.dbeaver = {
    enable = true;
    package = pkgs-unstable.dbeaver-bin;
  };
}
