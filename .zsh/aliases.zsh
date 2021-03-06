#
# Set personal aliases.
#

# Helpers
alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias cfgd="cfg difftool --no-symlinks --dir-diff"
alias omd="kitty +kitten diff"
alias omgd="git difftool --no-symlinks --dir-diff"
alias ls="ls --color=tty --group-directories-first"
alias lsd="lsd -la -rt --group-dirs first"
alias sudo="nocorrect sudo -E "
alias glances="glances --disable-bg"
alias used="du -ah -d 1 | sort -rh | less"

# Shortcuts
alias zshrc="$EDITOR ~/.zshrc"
alias vimcfg="$EDITOR ~/.config/nvim/init.vim"
alias aliases="$EDITOR ~/.zsh/aliases.zsh"

# Just for fun
alias neoarch="clear && neofetch --source ~/scripts/archlogo --gap -785"
alias lolban="postbanner -t '-t -f 3d.flf' -l '-t -p 1'"
alias cookie="fortune -ae computers debian linux linuxcookie | cowsay | lolcat -t"
alias yolo='git commit -m "$(curl -s whatthecommit.com/index.txt)"'
