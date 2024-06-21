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
    local num_chars=${2:-$(tput cols)}
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
    # print_symbol_line "-" "" "magenta"
    # echo
    return 0
}
function footer() {
    echo
    # print_symbol_line "-" "" "magenta"
}

function fetch_files() {
    
    err_str=""
    is_changed=false

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
        # echo "Select files for creating backup!"

        # Bash 
        bash_target=~/.bashrc # Actual file target
        if [[ -f $bash_target ]]; then # No need to ask for a backup, if the user don't have .bashrc file
            # Main call
            # $1) Filename
            # $2) File path 
            # $3) Question 
            # $4) Output target 
            # $5) Forwarding first argument of current function ($1) 
            if [[ $1 = "push" || $1 = "" || $1 = "pushx" ]]; then
                sync_file .bashrc ~/.bashrc "Backup <<bash config>> file?" $final_target/shell $1 
            elif [[ $1 = "pull" || $1 = "pullx" ]]; then
                sync_file .bashrc $final_target/shell/.bashrc "Restore <<bash config>> file?" ~ $1 
            fi
        fi

        # Fish
        fish_target=~/.config/fish/config.fish # Actual file target
        if [[ -f $fish_target ]]; then  # No need to ask for a backup, if the user don't have config.fish file
            if [[ $1 = "push" || $1 = "" || $1 = "pushx" ]]; then
                sync_file config.fish ~/.config/fish/config.fish "Backup <<fish config>> file?" $final_target/shell $1 
            elif [[ $1 = "pull" || $1 = "pullx" ]]; then
                sync_file config.fish $final_target/shell/config.fish "Restore <<fish config>> file?" ~/.config/fish $1 
            fi
        fi

        # Zsh
        zsh_target=~/.zshrc # Actual file target
        if [[ -f $zsh_target ]]; then  # No need to ask for a backup, if the user don't have .zshrc file
            if [[ $1 = "push" || $1 = "" || $1 = "pushx" ]]; then
                sync_file .zshrc ~/.zshrc "Backup <<zsh config>> file?" $final_target/shell $1
            elif [[ $1 = "pull" || $1 = "pullx" ]]; then
                sync_file .zshrc $final_target/shell/.zshrc "Restore <<zsh config>> file?" ~ $1
            fi
        fi

        # Alias
        alias_target=~/.aliases # Actual file target
        if [[ -f $alias_target ]]; then  # No need to ask for a backup, if the user don't have .alias file
            if [[ $1 = "push" || $1 = "" || $1 = "pushx" ]]; then
                sync_file .aliases ~/.aliases "Backup <<aliases>> file?" $final_target/shell $1 # $1) filename $2) file path $3) question $4) output target 
            elif [[ $1 = "pull" || $1 = "pullx" ]]; then
                sync_file .aliases $final_target/shell/.aliases "Restore <<aliases>> file?" ~ $1 # $1) filename $2) file path $3) question $4) output target 
            fi
        fi

        # i3 
        i3_target=~/.config/i3/config # Actual file target
        if [[ -f $i3_target ]]; then # No need to ask for a backup, if the user don't have i3config file
            if [[ $1 = "push" || $1 = "" || $1 = "pushx" ]]; then
                sync_file config ~/.config/i3/config "Backup <<i3 config>> file?" $final_target/i3 $1 
            elif [[ $1 = "pull" || $1 = "pullx" ]]; then
                sync_file config $final_target/i3/config "Restore <<i3 config>> file?" ~/.config/i3 $1 
            fi
        fi

        # Vim 
        vim_target=~/.vimrc # Actual file target
        if [[ -f $vim_target ]]; then  # No need to ask for a backup, if the user don't have .vimrc file
            if [[ $1 = "push" || $1 = "" || $1 = "pushx" ]]; then
                sync_file .vimrc ~/.vimrc "Backup <<vim config>> file?" $final_target/vim $1 
            elif [[ $1 = "pull" || $1 = "pullx" ]]; then
                sync_file .vimrc $final_target/vim/.vimrc "Restore <<vim config>> file?" ~ $1 
            fi
        fi

        # Tmux 
        tmux_target=~/.tmux.conf # Actual file target
        if [[ -f $tmux_target ]]; then  # No need to ask for a backup, if the user don't have .tmux.conf file
            if [[ $1 = "push" || $1 = "" || $1 = "pushx" ]]; then
                sync_file .tmux.conf ~/.tmux.conf "Backup <<tmux config>> file?" $final_target/tmux $1 # $1) filename $2) file path $3) question $4) output target 
            elif [[ $1 = "pull" || $1 = "pullx" ]]; then
                sync_file .tmux.conf $final_target/tmux/.tmux.conf "Restore <<tmux config>> file?" ~ $1 # $1) filename $2) file path $3) question $4) output target 
            fi
        fi

        # Vscode user settings
        vscode_user_settings_target=~/.config/Code/User/settings.json # Actual file target

        if [[ -f $vscode_user_settings_target ]]; then  # No need to ask for a backup, if the user don't have settings.json file
            if [[ $1 = "push" || $1 = "" || $1 = "pushx" ]]; then
                sync_file settings.json ~/.config/Code/User/settings.json "Backup <<vscode user settings>> file?" $final_target/vscode $1 
            elif [[ $1 = "pull" || $1 = "pullx" ]]; then
                sync_file settings.json $final_target/vscode/settings.json "Restore <<vscode user settings>> file?" ~/.config/Code/User/ $1 
            fi
        fi

        # Lf 
        lf_target=~/.config/lf/lfrc # Actual file target
        if [[ -f $lf_target ]]; then  # No need to ask for a backup, if the user don't have lfrc file
            if [[ $1 = "push" || $1 = "" || $1 = "pushx" ]]; then
                sync_file lfrc ~/.config/lf/lfrc "Backup <<lf config>> file?" $final_target/lf $1 
            elif [[ $1 = "pull" || $1 = "pullx" ]]; then
                sync_file lfrc $final_target/lf/lfrc "Restore <<lf config>> file?" ~/.config/lf $1 
            fi
        fi

        # dnf 
        if command -v dnf > /dev/null 2>&1; then  # No need to ask for a backup, if the user don't have dnf package manager (a non RHEL/Fedora user)
            if [[ $1 = "push" || $1 = "" || $1 = "pushx" ]]; then
                local temp_dir=$final_target/dnf/temp
                mkdir -p $temp_dir
                local temp_file_name=packages.txt
                local temp_file_path=$temp_dir/$temp_file_name
                dnf history userinstalled | tail -n +2 > $temp_file_path
                sync_file $temp_file_name $temp_file_path "Backup <<dnf user-installed packages>> file?" $final_target/dnf $1 
                rm -rf $temp_dir 
            elif [[ $1 = "pull" || $1 = "pullx" ]]; then
                local dnf_installed_packages="$final_target/dnf/packages.txt"
                if [[ -f $dnf_installed_packages ]]; then 

					local temp_dir=$final_target/dnf/temp
					mkdir -p $temp_dir
					local temp_file_name=packages.txt
					local temp_file_path=$temp_dir/$temp_file_name
					dnf history userinstalled | tail -n +2 > $temp_file_path

					# Checking for any differences 
					if ! cmp -s $dnf_installed_packages $temp_file_path; then
						is_changed=true
						if [[ $1 = "pullx" ]]; then
							confirmation="y"
						else 
							echo
							echo -en "Do you want to install $(get_color_code "cyan")dnf packages$(get_color_code "unset") (y/n) : "
							read -n 1 confirmation
							if [[ $confirmation != "" ]]; then echo; fi # Only print new line if the confirmation is a character
						fi

						case $confirmation in 
							"y" | "Y")
								local file_content=$dnf_installed_packages 
								mapfile -t packages < "$file_content"
								echo
								local package_header="Packages to be installed (dnf)"
								local package_header_length=${#package_header}
								echo -e "$(get_color_code "yellow")$package_header$(get_color_code "unset")"
								print_symbol_line "-" $package_header_length

								local unfound_packages=()
								for package in "${packages[@]}"; do
									# Check if the package is already installed
									if ! rpm -q "$package" &>/dev/null; then
										# echo -e "Installing $(get_color_code "green")$package...$(get_color_code "unset")"
										# sudo dnf install -y "$package"
										unfound_packages+=($package)
									fi
								done

								for package in "${unfound_packages[@]}"; do 
									echo "$package"
								done

								while true; do 
									echo
									echo -n "Are you sure to install (y/n) : "
									read -n 1 confirmation
									if [[ $confirmation != "" ]]; then echo; fi # Only print new line if the confirmation is a character

									case $confirmation in 
										"y" | "Y")
											sudo dnf install "${unfound_packages[@]}"
											break
											;;
										"n" | "N")
											echo -e "$(get_color_code "yellow")No packages installed...$(get_color_code "unset")"
											break
											;;
										"q" | "Q") 
											echo -e "$(get_color_code "green")Completed...$(get_color_code "unset")"
											footer  
											exit 0
											;;
										*)
											echo -e "$(get_color_code "red")Invalid option...$(get_color_code "unset")"
											;;
									esac
								done
								;;
							"n" | "N")
								echo -e "$(get_color_code "yellow")No packages installed...$(get_color_code "unset")"
								break
								;;
							"q" | "Q") 
								echo -e "$(get_color_code "green")Completed...$(get_color_code "unset")"
								footer  
								exit 0
								;;
							*)
								echo -e "$(get_color_code "red")Invalid option...$(get_color_code "unset")"
								;;
						esac
						rm -rf $temp_dir 
					fi					
                fi
            fi
        fi

        # CHECKING and DISPLAYING any Errors if found 
        # if [[ "$err_str" != "" ]]; then 
        #     error_provider "$err_str"
        # fi
    fi

    if [[ $is_changed = false && $1 ]]; then
		if ! [[ $1 = "pushx" || $1 = "pullx" ]]; then echo; fi 
        echo -e "$(get_color_code "green") Everything is up-to-date$(get_color_code "unset")"
    fi
}

# Function for pushing to the remote repo
function remote_push() {
	local push_message=${1:-"Dotfiles updated (from mew)"}
	if [[ -d "$final_target/.git" ]]; then
		if command -v git &> /dev/null; then
			cd $final_target
			echo 
			git add .
			git commit -m "$push_message"
			git push
			cd -
		else
			echo -e "\n Please install 'git' before continuing"
		fi
	else
		echo -e "\n Dotfiles is not a git directory"
	fi
}

# Function for pulling from the remote repo
function remote_pull() {
	if [[ -d "$final_target/.git" ]]; then
		if command -v git &> /dev/null; then
			cd $final_target
			echo 
			git pull
			cd -
		else
			echo -e "\n Please install 'git' before continuing"
		fi
	else
		echo -e "\n Dotfiles is not a git directory"
	fi
}

# ? Program starts here 
header

if [[ $# -eq 0 ]]; then 
    fetch_files 
else 
    if [[ $1 = "push" ]]; then 
        if [[ $# -eq 1 ]]; then
            fetch_files "push"
		else 
			echo -e "\n usage : mew push"
        fi
    elif [[ $1 = "pushx" ]]; then
        if [[ $# -eq 1 ]];then 
			echo
            fetch_files "pushx"
		else 
			echo -e "\n usage : mew pushx"
        fi
    elif [[ $1 = "pull" ]]; then
        if [[ $# -eq 1 ]];then 
            fetch_files "pull"
		else 
			echo -e "\n usage : mew pull"
        fi
    elif [[ $1 = "pullx" ]]; then
        if [[ $# -eq 1 ]];then 
			echo
            fetch_files "pullx"
		else
			echo -e "\n usage : mew pullx"
        fi
	elif [[ $1 = "remote" ]]; then 
	    if [[ $# -eq 1 || $# -ge 4 ]];then 
			echo -e "\n usage : mew remote <push|pull> <push:message if any>"
		elif [[ $# -eq 2 ]]; then
			if [[ $2 = "push" ]]; then
				remote_push 
			elif [[ $2 = "pull" ]]; then
				remote_pull 
			else
				echo -e "\n usage : mew remote <push|pull> <push:message if any>"
			fi
		elif [[ $# -eq 3 ]]; then
			if [[ $2 = "push" ]]; then
				remote_push $3
			else
				echo -e "\n usage : mew remote <push|pull> <push:message if any>"
			fi
		else
			echo -e "$(get_color_code "red")Invalid command$(get_color_code "unset") $3 ..."
		fi
    elif [[ $1 = "view" ]]; then
        if [[ $# -eq 1 ]]; then
            if [[ -d $final_target ]]; then
                if command -v tree &> /dev/null; then
                    tree -a -I '.git' -I 'README.md' -I '.gitignore' $final_target
                else
                    echo -e "\n Please install 'tree' package for using view"
                fi
            else 
                echo "Dotfiles not found"
            fi
        fi
    else 
        echo
        echo -e "$(get_color_code "red")Invalid command$(get_color_code "unset") $1 ..."
    fi
fi

footer
# ? Program ends here