# !/bin/bash
# shell targets 

bash_target=~/.bashrc
fish_target=~/.config/fish/config.fish
zsh_target=~/.zshrc

final_target=~/userfiles

# creating user files directory if not already exists
if ! [[ -d $final_target ]]; then
    if [[ -f $final_target ]]; then 
        rm $final_target
    fi
    mkdir -p $final_target
fi

if test -f $bash_target; then
    while true; do 
        read -p "Do you want to backup bash config file to dotfiles? (y/n) : " confirmation 
        case $confirmation in 
            y)
                cp $bash_target $final_target 
                echo "Bash config file copied to $final_target"
                break 
                ;;
            n)
                echo "No changes are made..."
                break
                ;;
            *)
                echo "Invalid input..."
                ;;
        esac
    done
else 
    echo "Bash file not found..."
fi