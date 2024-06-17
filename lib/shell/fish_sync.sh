function fish_sync() {
    # Main call
    # $1) Filename
    # $2) File path 
    # $3) Question 
    # $4) Output target 
    # $5) Forwarding first argument of current function ($1) 
    sync_file config.fish ~/.config/fish/config.fish "Backup <<fish config>> file?" $final_target/shell $1 
}