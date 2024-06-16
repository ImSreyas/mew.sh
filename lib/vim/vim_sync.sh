function vim_sync() {
    # Main call
    sync_file .vimrc ~/.vimrc "Backup <<vim config>> file?" $final_target/vim $1 # $1) filename $2) file path $3) question $4) output target 
}
