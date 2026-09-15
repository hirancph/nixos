{...}: {
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            rightalt = "leftcontrol";
            #space = "overload(control, space)"; #disable becuase of milliseconds delay
          };
          shift = {
            capslock = "capslock";
          };
        };
      };
    };
  };
}
