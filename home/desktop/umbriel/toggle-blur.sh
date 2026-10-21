#!/usr/bin/env bash
FILE="$HOME/.config/umbriel/rules.toml"
mkdir -p "$(dirname "$FILE")"

if [ ! -f "$FILE" ] || grep -q "blur = true" "$FILE"; then
    printf '[[window_rule]]\nblur = false\nopacity = 1.0\n' > "$FILE"
else
    printf '[[window_rule]]\nblur = true\nopacity = 0.8\n' > "$FILE"
fi
