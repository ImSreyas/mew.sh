function update() {
    if ! [[ -d $output_target ]]; then 
        if [[ -f $output_target ]]; then
            rm -f $output_target
        fi
        mkdir -p $output_target # Create the output directory if it doesn't exist
    fi
    if [[ -f $output_target/$file_name ]]; then 
        if ! cmp -s $output_target/$file_name $file_target; then
            echo 
            local header_string="$(get_color_code "yellow")Changes$(get_color_code "unset") ($file_name)"
            echo -e $header_string
            print_symbol_line "-" ${#header_string} 
            diff -c --color=always $output_target/$file_name $file_target
            echo 
            while true; do
                echo -n "Do you want to update? (y/n): "
                read confirmation
                
                case $confirmation in
                    "y" | "yes" | "Yes" | "Y" | "YES")
                        cp $file_target $output_target 
                        echo -e "$(get_color_code "yellow")$file_name$(get_color_code "green") updated...$(get_color_code "unset")"
                        break
                        ;;
                    "n" | "no" | "No" | "N" | "NO" | "")
                        echo -e "$(get_color_code "yellow")No changes are made...$(get_color_code "unset")"
                        break
                        ;;
                    "q" | "Q") 
                        echo -e "$(get_color_code "green")Completed...$(get_color_code "unset")"
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
        cp $file_target $output_target 
        echo -e "$(get_color_code "yellow")$file_name$(get_color_code "green") backup created at $(get_color_code "yellow")$output_target$(get_color_code "unset")"
    fi 
}