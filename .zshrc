export ZSH_CUSTOM=/usr/share/zsh
export ZSH_SHAUN=$HOME/.zsh
export DEFAULT_USER="shaun"
export EDITOR="nvim"

# Turn off static titles ($ autotitle)
autotitle() { export TITLE_OVERRIDDEN=0 }; autotitle

# Condition checking if title is overridden
overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }

# Echo asterisk if git state is dirty
gitDirty() { [[ $(git status 2> /dev/null | grep -o '\w\+' | tail -n1) != ("clean"|"") ]] && echo "*" }

# Show cwd when shell prompts for input.
tabtitle_precmd() {
   if overridden; then return; fi
   pwd=$(pwd) # Store full path as variable
   cwd=${pwd##*/} # Extract current working dir only
   print -Pn "\e]0;$pwd$(gitDirty)\a" # Replace with $pwd to show full path
}
[[ -z $precmd_functions ]] && precmd_functions=() precmd_functions=($precmd_functions tabtitle_precmd)

# Prepend command (w/o arguments) to cwd while waiting for command to complete.
tabtitle_preexec() {
   if overridden; then return; fi
   printf "\033]0;%s\a" "${1%%} | $pwd$(gitDirty)" # Omit construct from $1 to show args
}
[[ -z $preexec_functions ]] && preexec_functions=()
preexec_functions=($preexec_functions tabtitle_preexec)

[[ -f $HOME/.LS_COLORS ]] && eval "`dircolors -b $HOME/.LS_COLORS`"

source $HOME/.zshrc.omz
for config ($ZSH_SHAUN/**/*.zsh) source $config

# Override auto-title when static titles are desired ($ title My new title)
title() { export TITLE_OVERRIDDEN=1; echo -en "\e]0;$*\a"}

# Colorize man page output
man(){
    local width=$(tput cols)
    ((width>MANWIDTH)) && width=$MANWIDTH

    MANWIDTH=$width \
    LESS_TERMCAP_md=$'\e[01;32m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;30m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[04;33m' \
    command man "$@"
}

# Plasma blur some shit
if [[ $(ps --no-header -p $PPID -o comm) =~ '^kitty$' ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi

eval "$(fasd --init auto)"
xset r rate 200 100
source ~/.zsh/shortcuts.zsh
