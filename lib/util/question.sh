function sync_file() { # Arguments : $1) filename $2) file path $3) question 
    # File target 
    local file_name=${1:-""} # Name of the file to be backuped
    local file_target=${2:-""} # Path of the file to be backuped
    local question=${3:-"$file_name?"} # Question for the file backup
    local output_target=${4:-$final_target} # Output target where the file should be copied to

    if [[ $file_target != "" && $file_name != "" && -f $file_target ]]; then

        case "$5" in
            "push" | "pull")
                if cmp -s "$output_target/$file_name" "$file_target"; then
                    return 0
                else
                    is_changed=true
                fi
            ;;
            "pushx" | "pullx")
                if cmp -s "$output_target/$file_name" "$file_target"; then
                    return 0
                else 
                    update $5
                    is_changed=true
                    return 0
                fi
            ;;
        esac

        while true; do 
            # Adding color code to the question
            # << for the start & >> for the end (Add these symbols to the question)
            highlight_color="cyan"
            question=$(echo $question | sed -e "s/<</\\$(get_color_code $highlight_color)/g" -e "s/>>/\\$(get_color_code "unset")/g") 
            echo
            if [[ -f $output_target/$file_name ]]; then 
                echo -ne "Update $question (y/n) : $(get_color_code "unset")"
            else 
                if [[ $5 = "pull" ]]; then 
                    echo -ne "Restor $question (y/n) : $(get_color_code "unset")"
                else 
                    echo -ne "Backup $question (y/n) : $(get_color_code "unset")"
                fi
            fi
            read -n 1 confirmation # Read the first character from the terminal
            if [[ ! $confirmation = "" ]]; then echo; fi # Only print new line if the confirmation is a character
            case $confirmation in 
                "y" | "Y")
                    update 
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
    # else 
        # todo: Can suppress this message bcz if the config not found then the user is not using that.
        # todo: No need to ask for the back up if the user is not using it. In this way we can remove an unwanted question?
        # echo "Bash config file not found..."
    fi
}
