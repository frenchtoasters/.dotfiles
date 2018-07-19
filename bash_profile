#!/usr/bin/env bash

# load in main config
# shellcheck source=/dev/null
test -f ~/.bashrc && source ~/.bashrc

# arch-specific settings
if [ -f "/etc/arch-release" ]; then
  # if we're in tty1, load startx
  if [[ $(tty) == "/dev/tty1" ]]; then
    if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
      exec startx
    fi
  fi
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
