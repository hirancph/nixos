{ pkgs-unstable, ... }: {
  programs.antigravity = {
    enable = true;
    package = pkgs-unstable.antigravity-ide-fhs;
  };
}
