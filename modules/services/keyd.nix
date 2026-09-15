{...}: {
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            shift = "layer(shift)";
            space = "overload(control, space)";
          };
          shift = {
            space = "space";
          };
        };
      };
    };
  };
}
