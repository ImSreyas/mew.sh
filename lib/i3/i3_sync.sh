function i3_sync() {
    # Main call
    # $1) Filename
    # $2) File path 
    # $3) Question 
    # $4) Output target 
    # $5) Forwarding first argument of current function ($1) 
    sync_file config ~/.config/i3/config "Backup <<i3 config>> file?" $final_target/i3 $1 
}