# !/bin/bash

# set -e

final_target=~/userfiles

# Library directory target
# lib_target=~/.zeo/lib
lib_target=./lib

# Creating USERFILES directory if not already exists
if ! [[ -d $final_target ]]; then
    if [[ -f $final_target ]]; then 
        rm $final_target
    fi
    mkdir -p $final_target
fi

# Printing line with a special character 
function print_symbol_line() {
    local symbol="$1" 
    local num_chars=$2
    local default_num_chars=8  
    local default_symbol="-"

    for i in $(seq 1 ${num_chars:-$default_num_chars}); do 
        echo -n -e "\e[36m${symbol:-$default_symbol}\e[0m"
    done; echo
}

# Errors 
# Common Err fix
function common_err_fix() {
    echo -e "\nCommon Error fix\n----------------"
    echo -e "Reinstall : \e[33m git clone https://github.com/ImSreyas/mew.git && cd mew && ./install.sh\e[0m\n"
}
# Source file not found error message 
function source_err() {
    echo -e "\nErrors\n------"
    echo -e "File not found : \e[31m$1\e[0m at $2" >&2
    common_err_fix
}

print_symbol_line "#"

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

print_symbol_line "#"