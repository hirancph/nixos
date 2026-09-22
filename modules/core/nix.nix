{config, pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = "";
    };
  };

  programs.nh = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    nvd
    nix-output-monitor
  ];
}
