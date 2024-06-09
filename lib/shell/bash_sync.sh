function bash_sync() {
    # Main call
    sync_file .bashrc ~/.bashrc "Bash file?" $final_target/shell # $1) filename $2) file path $3) question $4) output target 
}