function sync_file() { # Arguments : $1) filename $2) file path $3) question 
    # File target 
    local file_name=${1:-""} # Name of the file to be backuped
    local file_target=${2:-""} # Path of the file to be backuped
    local question=${3:-"$file_name?"} # Question for the file backup

    if [[ $file_target != "" && $file_name != "" && -f $file_target ]]; then
        while true; do 
            echo
            read -p "$question (y/n/q) : " confirmation 
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
    # else 
        # todo: Can suppress this message bcz if the config not found then the user is not using that.
        # todo: No need to ask for the back up if the user is not using it. In this way we can remove an unwanted question?
        # echo "Bash config file not found..."
    fi
}
