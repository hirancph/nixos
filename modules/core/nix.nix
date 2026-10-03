{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = "";
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
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
