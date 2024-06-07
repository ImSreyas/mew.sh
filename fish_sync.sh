
function fish_sync() {
    # fish config file target 
    local fish_target=~/.config/fish/config.fish
    local file_name=config.fish

    if test -f $fish_target; then
        while true; do 
            read -p "Do you want to backup fish config file to dotfiles? (y/n) : " confirmation 
            case $confirmation in 
                y)
                    update
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
        echo "fish file not found..."
    fi
}

function update() {
    if [[ -f $final_target/$file_name ]]; then 
        if ! cmp -s $final_target/$file_name $fish_target; then
            echo -e "\nUpcoming changes\n----------------"
            diff -c --color=always $final_target/$file_name $fish_target
            echo 
            while true; do
                echo -n "Do you want to update? (y/n): "
                read confirmation
                
                if [ "$confirmation" = "y" ]; then
                    cp $fish_target $final_target 
                    echo "fish config updated..."
                    break
                elif [ "$confirmation" = "n" ]; then 
                    echo "No changes are made..."
                    break
                else 
                    echo "Invalid option..."
                fi
            done
        else 
            echo -e "\e[32mAlready upto date...\e[0m"
        fi
    else 
        cp $fish_target $final_target 
        echo "fish config file backup created at $final_target"
    fi 
}
