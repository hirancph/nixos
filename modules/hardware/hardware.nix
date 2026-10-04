{ ... }: {
  hardware.enableRedistributableFirmware = true;
  zramSwap.enable = true;

  # Btrfs compression
  fileSystems."/" = {
    options = [
      "compress=zstd:1"
      "noatime"
      "discard=async"
      "space_cache=v2"
    ];
  };

  fileSystems."/nix" = {
    options = [
      "compress=zstd:1"
      "noatime"
      "discard=async"
      "space_cache=v2"
    ];
  };

  fileSystems."/home" = {
    options = [
      "compress=zstd:1"
      "noatime"
      "discard=async"
      "space_cache=v2"
    ];
  };

  # fix corruption or disk failure
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };

}
