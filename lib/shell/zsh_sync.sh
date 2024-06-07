function zsh_sync() {
    # Zsh config file target 
    local zsh_target=~/.zshrc
    local file_name=.zshrc

    if test -f $zsh_target; then
        while true; do 
            read -p "Zsh config? (y/n/q) : " confirmation 
            case $confirmation in 
                "y" | "yes" | "Yes" | "Y" | "YES")
                    update
                    break 
                    ;;
                "n" | "no" | "No" | "N" | "NO" | "")
                    echo -e "$(get_color_code "yellow")No changes are made...$(get_color_code "unset")"
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
        echo "Zsh config file not found..."
    fi
}

function update() {
    if [[ -f $final_target/$file_name ]]; then 
        if ! cmp -s $final_target/$file_name $zsh_target; then
            diff -c --color=always $final_target/$file_name $zsh_target
            echo 
            while true; do
                echo -n "Do you want to update? (y/n): "
                read confirmation
                
                if [ "$confirmation" = "y" ]; then
                    cp $zsh_target $final_target 
                    echo -e "$(get_color_code "green")Zsh config updated...$(get_color_code "unset")"
                    break
                elif [ "$confirmation" = "n" ]; then 
                    echo -e "$(get_color_code "yellow")No changes are made...$(get_color_code "unset")"
                    break
                else 
                    echo -e "$(get_color_code "red")Invalid option...$(get_color_code "unset")"
                fi
            done
        else 
            echo -e "$(get_color_code "green")Already upto date...$(get_color_code "unset")"
        fi
    else 
        cp $zsh_target $final_target 
        echo -e "$(get_color_code "green")Zsh config file backup created at $(get_color_code "yellow")$final_target$(get_color_code "unset")"
    fi 
}
