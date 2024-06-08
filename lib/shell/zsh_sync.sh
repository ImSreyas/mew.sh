function zsh_sync() {
    # Main call
    sync_file .zshrc ~/.zshrc "Zsh file?" # $1) filename $2) file path $3) question 
}