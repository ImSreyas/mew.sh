function bash_sync() {
    # Main call
    sync_file .bashrc ~/.bashrc "Bash file?" # $1) filename $2) file path $3) question 
}