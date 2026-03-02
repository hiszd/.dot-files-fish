function prm --description 'Remove Arch packages'
    sudo pacman -Rsu $argv
end
