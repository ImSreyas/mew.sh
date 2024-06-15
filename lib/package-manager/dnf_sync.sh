function dnf_sync() {
    local temp_dir=$final_target/dnf/temp
    mkdir -p $temp_dir
    local temp_file_name=packages.txt
    local temp_file_path=$temp_dir/$temp_file_name
    dnf history userinstalled | tail -n +2 > $temp_file_path
    sync_file $temp_file_name $temp_file_path "Backup dnf user installed packages?" $final_target/dnf $1 # $1) filename $2) file path $3) question $4) output target 
    rm -rf $temp_dir 
}