
function bash_sync() {
    # Bash config file target 
    local bash_target=~/.bashrc
    local file_name=.bashrc

    if test -f $bash_target; then
        while true; do 
            read -p "Do you want to backup bash config file to dotfiles? (y/n) : " confirmation 
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
        echo "Bash file not found..."
    fi
}

function update() {
    if [[ -f $final_target/$file_name ]]; then 
        if ! cmp -s $final_target/$file_name $bash_target; then
            diff -c --color=always $final_target/$file_name $bash_target
            echo 
            while true; do
                echo -n "Do you want to update? (y/n): "
                read confirmation
                
                if [ "$confirmation" = "y" ]; then
                    cp $bash_target $final_target 
                    echo "Bash config updated..."
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
        cp $bash_target $final_target 
        echo "Bash config file backup created at $final_target"
    fi 
}