
# Bash config file target 
bash_target=~/.bashrc
file_name=.bashrc
# actual_file="../packages.txt"
# temp_file="copy.txt"

bash_sync() {
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

update() {
    if [[ -f $final_target/$file_name ]]; then 
        if ! cmp -s $final_target/$file_name $bash_target; then
            diff --color=always $final_target/$file_name $bash_target
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
            echo "Already upto date..."
        fi
    else 
        cp $bash_target $final_target 
        echo "Bash config file backup created at $final_target"
    fi 
}