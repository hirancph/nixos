{ pkgs, ... }:
let
  umbrielToggleBlur = pkgs.writeShellScriptBin "umbriel-toggle-blur" (
    builtins.readFile ./toggle-blur.sh
  );
in
{
  # WINDOW FOCUS
  # VIM
  "Mod+J" = "window-focus-or-workspace-down";
  "Mod+K" = "window-focus-or-workspace-up";
  "Mod+H" = "window-focus-left";
  "Mod+L" = "window-focus-right";
  # CLASSIC
  "Mod+WheelUp" = "window-focus-left";
  "Mod+WheelDown" = "window-focus-right";
  "Mod+Down" = "window-focus-or-workspace-down";
  "Mod+Up" = "window-focus-or-workspace-up";
  "Mod+Left" = "window-focus-left";
  "Mod+Right" = "window-focus-right";

  # WINDOW AND WORKSPACE NAVIGATION
  # VIM
  "Mod+Shift+J" = "window-move-or-workspace-down";
  "Mod+Shift+K" = "window-move-or-workspace-up";
  "Mod+Shift+H" = "column-move-left";
  "Mod+Shift+L" = "column-move-right";
  # CLASSIC
  "Mod+Shift+WheelUp" = "column-move-left";
  "Mod+Shift+WheelDown" = "column-move-right";
  "Mod+Shift+Down" = "window-move-or-workspace-down";
  "Mod+Shift+Up" = "window-move-or-workspace-up";
  "Mod+Shift+Left" = "column-move-left";
  "Mod+Shift+Right" = "column-move-right";

  # UMBRIEL
  "Mod+Shift+Escape" = "session-quit";
  "Mod+Tab" = "overview-toggle";

  # NOCTALIA BINDS
  "Mod+space" = "spawn:noctalia msg panel-toggle launcher";
  "Mod+Escape" = "spawn:noctalia msg panel-toggle session";
  "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";
  "Mod+W" = "spawn:noctalia msg panel-toggle wallpaper";
  "Print" = "spawn:noctalia msg screenshot-fullscreen";
  "Mod+Print" = "spawn:noctalia msg screenshot-window";
  "Mod+Shift+Print" = "spawn:noctalia msg screenshot-region";
  "Pause" = "spawn:noctalia msg media toggle";
  "Mod+F11" = "spawn:noctalia msg media previous";
  "Mod+F12" = "spawn:noctalia msg media next";
  "Mod+minus" = "spawn:noctalia msg volume-down";
  "Mod+equal" = "spawn:noctalia msg volume-up";

  # WINDOW MANAGEMENT
  "Mod+Q" = "window-close";
  "Mod+Shift+Q" = "window-kill";
  "Mod+F" = "window-toggle-maximize";
  "Mod+Shift+F" = "window-toggle-fullscreen";
  "Mod+Alt+F" = "window-toggle-floating";
  "Mod+Ctrl+F" = "window-focus-switch-floating";
  "Mod+Shift+Tab" = "workspace-set-layout:toggle";
  "Mod+O" = "spawn:${umbrielToggleBlur}/bin/umbriel-toggle-blur";

  # LAUNCH APPLICATIONS
  "Mod+Return" = {
    action = "spawn:kitty";
    repeat = false;
  };
  "Mod+Y" = {
    action = "spawn:kitty -e yazi";
    repeat = false;
  };
  "Mod+B" = {
    action = "spawn:zen-beta";
    repeat = false;
  };
  "Mod+Shift+E" = {
    action = "spawn:dolphin";
    repeat = false;
  };
  "Mod+E" = {
    action = "spawn:emacs";
    repeat = false;
  };
}
