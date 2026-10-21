{
  inputs,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [ inputs.umbriel.homeModules.default ];
  programs.umbriel = {
    enable = true;

    settings = {
      include = {
        files = [ "rules.toml" ];
      };
      environment = import ./environment.nix;
      general = import ./general.nix;
      input = import ./input.nix;
      keybinds = import ./keybinds.nix { inherit pkgs; };
      layout = import ./layout.nix;
      appearance = import ./appearance.nix;
      colors = import ./colors.nix;
      window_rule = import ./window_rule.nix;
      layer_rule = import ./layer_rule.nix;
      overview = import ./overview.nix;
    };
  };
  home.packages = with pkgs-unstable; [
    xwayland
  ];
}
