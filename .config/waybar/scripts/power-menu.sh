#!/usr/bin/env bash

# shellcheck disable=SC1091
source "$HOME/.config/waybar/scripts/theme-switcher.sh" 'fzf'

list=$(printf '%s\n' 'Lock' 'Logout' 'Suspend' 'Reboot' 'Shutdown')

options=(
	--border=sharp
	--border-label=' Power Menu '
	--height=~100%
	#--highlight-line
	#--no-input
	#--pointer=
	--reverse
)
# shellcheck disable=SC2154
options+=("${colors[@]}")

selected=$(fzf "${options[@]}" <<<"$list")

[[ -z $selected ]] && exit 0

case "$selected" in
    'Lock')
        bash -c 'swaylock -C $HOME/.config/swaylock/config'
        ;;
    'Logout')
        swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'
        ;;
    'Suspend')
        systemctl suspend
        ;;
    'Reboot')
        systemctl reboot
        ;;
    'Shutdown')
        systemctl poweroff
        ;;
esac

exit 0
