# !/bin/bash

# set -e

declare final_target=~/dotfiles
readonly final_target

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
    echo "File not found : $(get_color_code "red")${1:-"Unknown"}$(get_color_code "unset") at ${2:-"Path unknown"}"
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
}
function error_provider() {
    err_string=${1:-"Unknown Error"}
    echo -e "\nErrors"
    print_symbol_line "-" 6
    echo -e $err_string
    common_err_fix
}

function header() {
    print_symbol_line "#" 8 "cyan"
    echo
}
function footer() {
    echo
    print_symbol_line "#" 8 "cyan"
}

# ? Program starts here 
header

err_str=""

# Question 
question_source_path=$lib_target/util/question.sh # Source targets 
if [[ -f $question_source_path ]]; then 
    source $question_source_path
else err_str+="$(source_err "question.sh" "mew/lib/util/question.sh")\n" # Appending error 
fi

# Updater 
updater_source_source_path=$lib_target/util/updater.sh # Source targets  # Source targets 
if [[ -f $updater_source_source_path ]]; then 
    source $updater_source_source_path
else err_str+="$(source_err "updater.sh" "mew/lib/util/updater.sh")" # Appending error 
fi

# Checking Question or Updater source files are missing
if [[ "$err_str" != "" ]]; then 
    error_provider "$err_str"
    # footer
    # exit 0 # There is no point in continuing if either Question or Updater source file is missing
else 
    echo "Select files for creating backup!"

    # Bash 
    bash_target=~/.bashrc # Actual file target
    bash_source_path=$lib_target/shell/bash_sync.sh # Source targets 

    if [[ -f $bash_target ]]; then # No need to ask for a backup, if the user don't have .bashrc file
        if [[ -f $bash_source_path ]]; then
            source $bash_source_path
            bash_sync 
        else err_str+="$(source_err "bash_sync.sh" "mew/lib/shell/bash_sync.sh")\n" # Appending error 
        fi
    fi

    # Fish
    fish_target=~/.config/fish/config.fish # Actual file target
    fish_source_path=$lib_target/shell/fish_sync.sh # Source targets 

    if [[ -f $fish_target ]]; then  # No need to ask for a backup, if the user don't have config.fish file
        if [[ -f $fish_source_path ]]; then
            source $fish_source_path
            fish_sync 
        else err_str+="$(source_err "fish_sync.sh" "mew/lib/shell/fish_sync.sh")\n" # Appending error 
        fi
    fi

    # Zsh
    zsh_target=~/.zshrc # Actual file target
    zsh_source_path=$lib_target/shell/zsh_sync.sh # Source targets 

    if [[ -f $zsh_target ]]; then  # No need to ask for a backup, if the user don't have .zshrc file
        if [[ -f $zsh_source_path ]]; then
            source $zsh_source_path
            zsh_sync 
        else err_str+="$(source_err "zsh_sync.sh" "mew/lib/shell/zsh_sync.sh")" # Appending error 
        fi
    fi

    # Vim 
    vim_target=~/.vimrc # Actual file target
    vim_source_path=$lib_target/vim/vim_sync.sh # Source targets 

    if [[ -f $vim_target ]]; then  # No need to ask for a backup, if the user don't have .vimrc file
        if [[ -f $vim_source_path ]]; then
            source $vim_source_path
            vim_sync 
        else err_str+="$(source_err "vim_sync.sh" "mew/lib/vim/vim_sync.sh")" # Appending error 
        fi
    fi


    # Vscode user settings
    vscode_user_settings_target=~/.config/Code/User/settings.json # Actual file target
    vscode_user_settings_source_path=$lib_target/vscode/user_settings_sync.sh # Source targets 

    if [[ -f $vscode_user_settings_target ]]; then  # No need to ask for a backup, if the user don't have settings.json file
        if [[ -f $vscode_user_settings_source_path ]]; then
            source $vscode_user_settings_source_path
            vscode_user_settings_sync 
        else err_str+="$(source_err "user_settings_sync.sh" "mew/lib/vscode/user_settings_sync.sh")" # Appending error 
        fi
    fi

<<<<<<< HEAD
=======
    # dnf 
    dnf_source_path=$lib_target/package-manager/dnf_sync.sh # Source targets 

    if command -v dnf > /dev/null 2>&1; then  # No need to ask for a backup, if the user don't have dnf package manager (a non RHEL/Fedora user)
        if [[ -f $dnf_source_path ]]; then
            source $dnf_source_path
            dnf_sync 
        else err_str+="$(source_err "dnf_sync.sh" "mew/lib/dnf/dnf_sync.sh")" # Appending error 
        fi
    fi

>>>>>>> dev
    # Lf 
    lf_target=~/.config/lf/lfrc # Actual file target
    lf_source_path=$lib_target/lf/lf_sync.sh # Source targets 

    if [[ -f $lf_target ]]; then  # No need to ask for a backup, if the user don't have lfrc file
        if [[ -f $lf_source_path ]]; then
            source $lf_source_path
            lf_sync 
        else err_str+="$(source_err "lf_sync.sh" "mew/lib/lf/lf_sync.sh")" # Appending error 
        fi
    fi

    # CHECKING and DISPLAYING any Errors if found 
    if [[ "$err_str" != "" ]]; then 
        error_provider "$err_str"
    fi
fi

footer
# ? Program ends here