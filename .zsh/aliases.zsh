#
# Set personal aliases.
#

# Helpers
alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias ls="ls --color=tty --group-directories-first"
alias sudo="nocorrect sudo -E "
alias updateindex="updatedb -l 0 -o ~/.Archive.db -U /var/run/media/shaun/Archive && updatedb -l 0 -o ~/.home.db -U /home/shaun"

# Shortcuts
alias note="sncli"
alias zshrc="$EDITOR ~/.zshrc"
alias vimcfg="$EDITOR ~/.config/nvim/init.vim"
alias i3cfg="$EDITOR ~/.config/i3/config"
alias polycfg="$EDITOR ~/.config/polybar/config"
alias aliases="$EDITOR ~/.zsh/aliases.zsh"

# Just for fun
alias neoarch="neofetch --backend ascii --source ~/scripts/archlogo --gap -785"
alias lolban="postbanner -t '-t -f 3d.flf' -l '-t -p 1'"
alias cookie="fortune -ae computers debian linux linuxcookie | cowsay | lolcat -t"
alias yolo='git commit -m "$(curl -s whatthecommit.com/index.txt)"'
