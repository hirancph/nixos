{ pkgs-unstable, ... }: {
  programs.obsidian = {
    enable = true;
    package = pkgs-unstable.obsidian;
  };
}
