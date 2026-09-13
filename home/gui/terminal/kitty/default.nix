{pkgs, lib, ...}: {
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    font = {
      name = lib.mkForce "Maple Mono NF";
      size = lib.mkForce 13;
    };

    settings = {
      hide_window_decorations = "titlebar-and-corners";
      background_opacity = lib.mkForce "0.8";
      window_padding_width = 10;
      placement_strategy = "center";

      #cursor customization
      cursor_shape = "beam";
      cursor_beam_thickness = "1.8";
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = "0";
      cursor_trail = 1;

      mouse_hide_wait = 60;
      copy_on_select = "clipboard";
      strip_trailing_spaces = "smart";

      #URL handling
      url_style = "curly";
      detect_urls = true;
      open_url_with = "default";
      underline_hyperlinks = "hover";

      scrollback_lines = 10000;
      wheel_scroll_multiplier = 3;
      touch_scroll_multiplier = 3;

      # Window behavior
      confirm_os_window_close = 0;
      remember_window_size = false;
      initial_window_width = "100c";
      initial_window_height = "30";

      # Selection colors
      selection_foreground = "none";
      selection_background = "none";
    };
  };
}
