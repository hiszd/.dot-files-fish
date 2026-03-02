set fish_greeting
set EDITOR nvim
export EDITOR=nvim
set VISUAL nvim

# 1. Identify the OS
set -l os_type (grep -w "^ID" /etc/os-release | cut -d'=' -f2 | tr -d '"')

# 2. Add the specific subdirectory IF it exists
set -l os_func_path "$__fish_config_dir/functions/$os_type"

if test -d $os_func_path
    # We prepend it to the path so OS-specific functions 
    # override agnostic ones if they have the same name.
    set fish_function_path $os_func_path $fish_function_path
end

set PATH $PATH ~/.cargo/bin/ ~/.local/share/nvim/lsp_servers ~/.local/bin ~/.opencode/bin
set LANGUAGE en_US.UTF-8
set LC_ALL en_US.UTF-8

set RUST_SRC_PATH "$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src"

set -x SHELL bash

function fish_user_key_bindings
    fish_vi_key_bindings
end

# ### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
# set fish_color_normal brcyan
# set fish_color_autosuggestion '#7d7d7d'
# set fish_color_command brcyan
# set fish_color_error '#ff6c6b'
# set fish_color_param brcyan

set nvm_default_version latest

### ALIASES ###

# # ls with all the flags
# alias ls='ls -lah --color=auto'

if status is-interactive
    if command -v zoxide &>/dev/null
        zoxide init fish | source
    end
end

# ls disks by label
alias dls='ls -lah --color=auto /dev/disk/by-label/'

# cd through the directories
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'

# tmux
alias tcr='tmux new -s '
alias tls='tmux ls'
alias trm='tmux kill-session -t '

# tmuxinator
alias tin='tmuxinator'
# alias tins='tmuxinator start'
alias tins="~/.config/muxrs/scripts/tmux-sessionizer 1 ~/.config"
alias tnew="~/.config/muxrs/scripts/tmux-sessionizer 2 ~/programming"
alias tat="~/.config/muxrs/scripts/tmux-attach"

# sudo stuff
alias reboot='sudo shutdown -r now'
alias ssysc='sudo systemctl'
alias sdown='sudo shutdown -h now'

# switch between shells
alias tofish="sudo chsh $USER -s fish && echo 'Now log out.'"
alias tobash="sudo chsh $USER -s bash && echo 'Now log out.'"

alias bright="sudo brightnessctl -d intel_backlight s "

fish_ssh_agent

# opam configuration
source /home/zion/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
