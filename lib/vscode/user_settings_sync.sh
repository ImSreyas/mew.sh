function vscode_user_settings_sync() {
    # Main call
    sync_file settings.json ~/.config/Code/User/settings.json "Vscode user settings file?" $final_target/vscode # $1) filename $2) file path $3) question $4) output target 
}
