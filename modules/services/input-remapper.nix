{ pkgs, ... }:

{
  services.input-remapper = {
    enable = true;
    package = pkgs.input-remapper;
  };

  environment.systemPackages = with pkgs; [
    input-remapper
  ];
}
