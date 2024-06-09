function zsh_sync() {
    # Main call
    sync_file .zshrc ~/.zshrc "Zsh file?" $final_target/shell # $1) filename $2) file path $3) question $4) output target 
}