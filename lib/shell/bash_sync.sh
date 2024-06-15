function bash_sync() {
    # Main call
    sync_file .bashrc ~/.bashrc "Backup <<bash config>> file?" $final_target/shell $1 # $1) filename $2) file path $3) question $4) output target 
    # if $val; then 
    #     echo "Working"
    # else
    #     echo "Not working"
    # fi
}