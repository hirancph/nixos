{ inputs, ... }: {
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      clock = {
        enabled = true;
        time_format = "{:%H:%M}";
      };
      appearance = {
        hide_logo = true;
      };
    };
  };
}
