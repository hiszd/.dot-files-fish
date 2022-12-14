set fish_greeting
set TERM "xterm-256color"
set EDITOR "nvim"
export EDITOR=nvim
set VISUAL "nvim"

set PATH $PATH ~/.cargo/bin/ ~/.local/share/nvim/lsp_servers ~/.local/bin
set LANGUAGE en_US.UTF-8
set LC_ALL en_US.UTF-8

set -x SHELL /bin/bash

function fish_user_key_bindings
  fish_vi_key_bindings
end

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### ALIASES ###

# config alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# apt package manager
alias aptud='sudo apt update'
alias aptug='sudo apt upgrade -y'
alias aptin='sudo apt install -y'
alias aptrm='sudo apt remove'
alias aptls='apt search'

# ls with all the flags
alias ls='ls -lah --color=auto'

# cd through the directories
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'

# mkdir create parents
alias mkdir='mkdir -pv'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'

# git
alias addup='git add -u'
alias addall='git add .'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias pull='git pull'
alias push='git push'

# tmux
alias tnew='tmux new -s'
alias tat='tmux a -t'
alias tls='tmux ls'

# sudo stuff
alias reboot='sudo reboot'
alias systemctl='sudo systemctl'
alias shutdown='sudo shutdown -h now'

# switch between shells
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"

alias newcon="openvpn3 session-start --config "

alias ttor="tmuxinator"

exec ./leader.sh

fish_ssh_agent
