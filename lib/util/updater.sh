function update() {
    if ! [[ -d $output_target ]]; then 
        if [[ -f $output_target ]]; then
            rm -f $output_target
        fi
        mkdir -p $output_target # Create the output directory if it doesn't exist
    fi
    if [[ -f $output_target/$file_name ]]; then 
        if ! cmp -s $output_target/$file_name $file_target; then
            if [[ ! $1 ]]; then 
                echo 
                local header_string="Changes ($file_name)" # Header string without colors 
                local header_len=${#header_string}
                local header_string="$(get_color_code "yellow")Changes$(get_color_code "unset") ($file_name)" # Shadowing with a new improved header string with colors
                echo -e $header_string
                print_symbol_line "-" $header_len
                diff -c --color=always $output_target/$file_name $file_target
                echo 
            fi

            while true; do
                if [[ $1 = "pushx" || $1 = "pullx" ]]; then
                    confirmation="y"
                else 
                    echo -n "Do you want to update? (y/n): "
                    read -n 1 confirmation # Reads only one character from the console
                    if [[ ! $confirmation = "" ]]; then echo; fi # Only print new line if the confirmation is a character
                fi
                
                case $confirmation in
                    "y" | "Y")
                        cp $file_target $output_target 
                        if [[ $1 = "pushx" || $1 = "pullx" ]]; then
                            echo -e "$(get_color_code "yellow")$output_target/$file_name$(get_color_code "green") updated...$(get_color_code "unset")"
                        else 
                            echo -e "$(get_color_code "yellow")$file_name$(get_color_code "green") updated...$(get_color_code "unset")"
                        fi
                        break
                        ;;
                    "n" | "N")
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