{ pkgs-unstable, ... }: {
  programs.distrobox = {
    enable = true;
    enableSystemdUnit = true;

    settings = {
      container_manager = "podman";
      non_interactive = "1";
      skip_workdir = "0";
    };

    containers = {
      archlinux = {
        image = "archlinux:latest";
        additional_packages = [
          # Most Important Packages
          "base-devel"
          "git"
          "curl"
          "wget"
          "ca-certificates"
          "which"
          "procps"

          # Cli Tools
          "eza"
          "bat"

        ];
        init = false;
        pull = true;
      };
    };
  };
}
