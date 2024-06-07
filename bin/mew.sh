# !/bin/bash

# set -e

final_target=~/userfiles

# Library directory target
# Production environment 
lib_target=~/.mew/lib
# Dev environment 
if [[ -d ../lib ]]; then 
    lib_target=../lib
elif [[ -d ./lib ]]; then
    lib_target=./lib
fi

# Creating USERFILES directory if not already exists
if ! [[ -d $final_target ]]; then
    if [[ -f $final_target ]]; then 
        rm $final_target
    fi
    mkdir -p $final_target
fi

# Color code finder 
function get_color_code() {
    local color_name="$1"
    local color_code="\e[0m"

    if [[ $color_name = "black" ]]; then color_code="\e[30m"
    elif [[ $color_name = "red" ]]; then color_code="\e[31m"
    elif [[ $color_name = "green" ]]; then color_code="\e[32m"
    elif [[ $color_name = "yellow" ]]; then color_code="\e[33m"
    elif [[ $color_name = "blue" ]]; then color_code="\e[34m"
    elif [[ $color_name = "magenta" ]]; then color_code="\e[35m"
    elif [[ $color_name = "cyan" ]]; then color_code="\e[36m"
    elif [[ $color_name = "white" ]]; then color_code="\e[37m"
    else color_code="\e[0m"
    fi

    echo $color_code
}

# Printing line with a special character 
function print_symbol_line() {
    local symbol="${1:-"-"}" 
    local num_chars=${2:-8}
    local color="${3:-"white"}"

    echo -n -e $(get_color_code $color) # Setting color 
    for i in $(seq 1 $num_chars); do 
        echo -n "$symbol"
    done; echo -e "\e[0m" # Unsetting color
}

# !Errors 
# Source file not found error message 
function source_err() {
    echo "File not found : $(get_color_code "red")$1$(get_color_code "unset") at $2"
}
# Common Err fix
function common_err_fix() {
    echo 
    echo "Common Error fix"
    print_symbol_line "-" 16

    echo -n "Reinstall : "
    echo -e -n "$(get_color_code "yellow")" # Setting yellow color
    echo -e -n "git clone https://github.com/ImSreyas/mew.git && cd mew && sh install.sh"
    echo -e "$(get_color_code "unset")" # Unsetting yellow color
    echo
}

function header() {
    print_symbol_line "#" 8 "cyan"
}
function footer() {
    print_symbol_line "#" 8 "cyan"
}

# ? Program starts here 
header

echo "Select config files for creating backup!"

# Importing SOURCE files 
# Targets 
bash_sync_target=$lib_target/shell/bash_sync.sh
fish_sync_target=$lib_target/shell/fish_sync.sh
zsh_sync_target=$lib_target/shell/zsh_sync.sh

# Checking availability of the SOURCE files 
# Bash 
err_str=""
if [[ -f $bash_sync_target ]]; then
    source $bash_sync_target
    bash_sync 
else 
    err_str+="$(source_err "bash_sync.sh" "mew/lib/shell/bash_sync.sh")\n" # Appending error 
fi
# Fish 
if [[ -f $fish_sync_target ]]; then
    source $fish_sync_target
    fish_sync 
else 
    err_str+="$(source_err "fish_sync.sh" "mew/lib/shell/fish_sync.sh")\n" # Appending error 
fi
# Zsh
if [[ -f $zsh_sync_target ]]; then
    source $zsh_sync_target
    zsh_sync 
else 
    err_str+="$(source_err "zsh_sync.sh" "mew/lib/shell/zsh_sync.sh")" # Appending error 
fi

# CHECKING and DISPLAYING any Errors if found 
if [[ "$err_str" != "" ]]; then 
    echo -e "\nErrors"
    print_symbol_line "-" 6
    echo -e $err_str
    common_err_fix
fi

footer
# ? Program ends here