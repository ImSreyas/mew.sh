
function fish_sync() {
    # fish config file target 
    local fish_target=~/.config/fish/config.fish
    local file_name=config.fish

    if test -f $fish_target; then
        while true; do 
            read -p "Fish config? (y/n/q) : " confirmation 
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
                    echo -e "$(get_color_code "green")Fish config updated...$(get_color_code "unset")"
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
        cp $fish_target $final_target 
        echo -e "$(get_color_code "green")Fish config file backup created at $(get_color_code "yellow")$final_target$(get_color_code "unset")"
    fi 
}
