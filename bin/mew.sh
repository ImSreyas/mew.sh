# !/bin/bash

# set -e

final_target=~/userfiles

# Library directory target
lib_target=~/.mew/lib
if [[ -d ../lib ]]; then 
    lib_target=../lib
fi

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

# !Errors 
# Source file not found error message 
function source_err() {
    echo "File not found : \e[31m$1\e[0m at $2"
}
# Common Err fix
function common_err_fix() {
    echo -e "\nCommon Error fix\n----------------"
    echo -e "Reinstall : \e[33m git clone https://github.com/ImSreyas/mew.git && cd mew && ./install.sh\e[0m\n"
}

# ? Program starts here 
print_symbol_line "#"

# Importing SOURCE files 
# Targets 
bash_sync_target=$lib_target/shell/bash_sync.sh
fish_sync_target=$lib_target/shell/fish_sync.sh

# Checking availability of the SOURCE files 
# Bash 
err_str=""
if [[ -f $bash_sync_target ]]; then
    source $bash_sync_target
    bash_sync 
else 
    err_str+="$(source_err "bash_sync.sh" "$lib_target/shell/bash_sync.sh")\n" # Appending error 
fi
# Fish 
if [[ -f $fish_sync_target ]]; then
    source $fish_sync_target
    fish_sync 
else 
    err_str+="$(source_err "fish_sync.sh" "$lib_target/shell/fish_sync.sh")" # Appending error 
fi
# CHECKING and DISPLAYING any Errors if found 
if [[ "$err_str" != "" ]]; then 
    echo -e "\nErrors\n------"
    echo -e $err_str
    common_err_fix
fi

print_symbol_line "#"
# ? Program ends here