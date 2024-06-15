function vscode_user_settings_sync() {
    # Main call
    # $1) Filename
    # $2) File path 
    # $3) Question 
    # $4) Output target 
    # $5) Forwarding first argument of current function ($1) 
    sync_file settings.json ~/.config/Code/User/settings.json "Backup vscode user settings file?" $final_target/vscode $1 
}
