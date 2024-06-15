function zsh_sync() {
    # Main call
    sync_file .zshrc ~/.zshrc "Backup zsh config file?" $final_target/shell $1 # $1) filename $2) file path $3) question $4) output target 
}