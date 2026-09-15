{...}: {
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
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
