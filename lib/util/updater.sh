function update() {
    if [[ -f $final_target/$file_name ]]; then 
        if ! cmp -s $final_target/$file_name $file_target; then
            diff -c --color=always $final_target/$file_name $file_target
            echo 
            while true; do
                echo -n "Do you want to update? (y/n): "
                read confirmation
                
                case $confirmation in
                    "y" | "yes" | "Yes" | "Y" | "YES")
                        cp $file_target $final_target 
                        echo -e "$(get_color_code "yellow")$file_name$(get_color_code "green") updated...$(get_color_code "unset")"
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
            echo -e "$(get_color_code "green")File already up-to-date...$(get_color_code "unset")"
        fi
    else 
        cp $file_target $final_target 
        echo -e "$(get_color_code "yellow")$file_name$(get_color_code "green") backup created at $(get_color_code "yellow")$final_target$(get_color_code "unset")"
    fi 
}