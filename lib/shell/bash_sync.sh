
function bash_sync() {
    # Bash config file target 
    local bash_target=~/.bashrc
    local file_name=.bashrc

    if test -f $bash_target; then
        while true; do 
            read -p "Bash config? (y/n/q) : " confirmation 
            case $confirmation in 
                "y" | "yes" | "Yes" | "Y" | "YES")
                    update
                    break 
                    ;;
                "n" | "no" | "No" | "N" | "NO" | "")
                    echo "No changes are made..."
                    break
                    ;;
                "q" | "Q") 
                    echo "Completed..."
                    footer  
                    exit 0
                    ;;
                *)
                    echo -e "$(get_color_code "red")Invalid option...$(get_color_code "unset")"
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
                    echo -e "$(get_color_code "green")Bash config updated...$(get_color_code "unset")"
                    break
                elif [ "$confirmation" = "n" ]; then 
                    echo "No changes are made..."
                    break
                else 
                    echo -e "$(get_color_code "red")Invalid option...$(get_color_code "unset")"
                fi
            done
        else 
            echo -e "$(get_color_code "green")Already upto date...$(get_color_code "unset")"
        fi
    else 
        cp $bash_target $final_target 
        echo -e "$(get_color_code "green")Bash config file backup created at $(get_color_code "yellow")$final_target$(get_color_code "unset")"
    fi 
}