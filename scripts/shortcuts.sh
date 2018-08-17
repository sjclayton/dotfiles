#!/bin/bash

# Shell RC file
shellrc="$HOME/.zshrc"

# Config locations
folders="$HOME/scripts/folders"

# Output locations
shell_shortcuts="$HOME/.zsh/shortcuts.zsh"
ranger_shortcuts="$HOME/.config/ranger/shortcuts.conf"

# Remove
rm -f "$shell_shortcuts" "$ranger_shortcuts"

# Ensuring that output locations are properly sourced
(grep "source ~/.zsh/shortcuts.zsh"  "$shellrc")>/dev/null || echo "source ~/.zsh/shortcuts.zsh" >> "$shellrc"
(grep "source ~/.config/ranger/shortcuts.conf" "$HOME/.config/ranger/rc.conf")>/dev/null || echo "source ~/.config/ranger/shortcuts.conf" >> "$HOME/.config/ranger/rc.conf"

# Format the `folders` file in the correct syntax and sent it to all three configs.
sed "/^#/d" "$folders" | tee >(awk '{print "alias "$1"=\"cd "$2" && ls -a\""}' >> "$shell_shortcuts") \
	>(awk '{print "map g"$1" cd "$2"\nmap t"$1" tab_new "$2"\nmap m"$1" shell mv -v %s "$2"\nmap Y"$1" shell cp -rv %s "$2}' >> "$ranger_shortcuts")

