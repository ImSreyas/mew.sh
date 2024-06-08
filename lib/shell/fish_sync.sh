function fish_sync() {
    # Main call
    sync_file config.fish ~/.config/fish/config.fish "Fish file?" # $1) filename $2) file path $3) question 
}