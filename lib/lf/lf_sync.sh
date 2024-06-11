function lf_sync() {
    # Main call
    sync_file lfrc ~/.config/lf/lfrc "lf config file?" $final_target/lf # $1) filename $2) file path $3) question $4) output target 
}