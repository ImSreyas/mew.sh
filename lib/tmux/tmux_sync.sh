function tmux_sync() {
    # Main call
    # $1) Filename
    # $2) File path 
    # $3) Question 
    # $4) Output target 
    # $5) Forwarding first argument of current function ($1) 
    sync_file .tmux.conf ~/.tmux.conf "Backup <<tmux config>> file?" $final_target/tmux $1 # $1) filename $2) file path $3) question $4) output target 
}
