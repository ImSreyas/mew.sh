# !/bin/bash

# set -e

final_target=~/userfiles

# Library directory target
# lib_target=~/.zeo/lib
lib_target=./scripts

# Creating USERFILES directory if not already exists
if ! [[ -d $final_target ]]; then
    if [[ -f $final_target ]]; then 
        rm $final_target
    fi
    mkdir -p $final_target
fi

# Errors 
# Common Err fix
common_err_fix() {
    echo -e "\nCommon Error fix\n----------------"
    echo -e "Reinstall : \e[33m git clone https://github.com/ImSreyas/mew.git && cd mew && ./install.sh\e[0m\n"
}
# Source file not found error message 
source_err() {
    echo -e "\nErrors\n------"
    echo -e "File not found : \e[31m$1\e[0m at $2" >&2
    common_err_fix
}

# Importing SOURCE files 
# Targets 
bash_sync_target=$lib_target/shell/bash_sync.sh
fish_sync_target=$lib_target/shell/fish_sync.sh

# Checking availability of the SOURCE files 
# Bash 
if ! source $bash_sync_target 2>/dev/null; then
    source_err "bash_sync.sh" "$lib_target/shell/bash_sync.sh"
else 
    bash_sync 
fi
# Fish 
if ! source $fish_sync_target 2>/dev/null; then
    source_err "fish_sync.sh" "$lib_target/shell/fish_sync.sh"
else 
    fish_sync 
fi