function fish_sync() {
    # Main call
    sync_file config.fish ~/.config/fish/config.fish "Fish file?" $final_target/shell # $1) filename $2) file path $3) question $4) output target 
}