set fish_greeting
set EDITOR "nvim"
export EDITOR=nvim
set VISUAL "nvim"

set PATH $PATH ~/.cargo/bin/ ~/.local/share/nvim/lsp_servers ~/.local/bin
set LANGUAGE en_US.UTF-8
set LC_ALL en_US.UTF-8

set RUST_SRC_PATH "$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src"

set -x SHELL bash

function fish_user_key_bindings
  fish_vi_key_bindings
end

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

set nvm_default_version "latest"

### ALIASES ###

# NIX aliases
alias ns='nix-shell --command "fish"'

# config alias
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# apt package manager
alias aptud='sudo apt update'
alias aptug='sudo apt upgrade -y'
alias aptin='sudo apt install -y'
alias aptrm='sudo apt remove'
alias aptls='apt search'

# zypper package manager
alias zud='sudo zypper update -y'
alias zin='sudo zypper install -y'
alias zrm='sudo zypper remove'
alias zls='sudo zypper search'

# ls with all the flags
alias ls='ls -lah --color=auto'

# ls disks by label
alias dls='ls -lah --color=auto /dev/disk/by-label/'

# cd through the directories
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'

# make the directory then cd into it
function mkcd
  mkdir -pv $argv[1] && cd $argv[1]
end

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
alias tcr='tmux new -s '
alias tls='tmux ls'
alias trm='tmux kill-session -t '

# tmuxinator
alias tin='tmuxinator'
alias tins='tmuxinator start'
alias tnew="~/.config/tmuxinator/scripts/tmux-sessionizer"
alias tat="~/.config/tmuxinator/scripts/tmux-attach"

# sudo stuff
alias reboot='sudo shutdown -r now'
alias systemctl='sudo systemctl'
alias sdown='sudo shutdown -h now'

# switch between shells
alias tofish="sudo chsh $USER -s fish && echo 'Now log out.'"
alias tobash="sudo chsh $USER -s bash && echo 'Now log out.'"

alias newcon="openvpn3 session-start --config "

alias ttor="tmuxinator"

alias rdep-dc01="rdesktop -u 'corp\administrator' -p ~ZqpMvgt5! 10.1.1.64 -f"
alias rdep-fp01="rdesktop -u 'corp\administrator' -p ~ZqpMvgt5! 10.1.1.65 -f"

alias nvim-zprog="nvimr 66.228.34.108:8001"

alias bright="sudo brightnessctl -d intel_backlight s "

# exec ./leader.sh

fish_ssh_agent

# opam configuration
source /home/zion/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
