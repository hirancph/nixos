{pkgs-unstable, config, lib, ...}:
{
  programs.emacs = {
    enable = true;
    package = pkgs-unstable.emacs-pgtk;
    };

  xdg.configFile."emacs".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/gui/emacs/emacs";

  home.packages = with pkgs-unstable; [
  ];
}
