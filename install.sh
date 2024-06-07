# Global variables 
main_dir=~/.mew 
main_executable=./bin/mew.sh
main_lib=./lib
bin_target=~/.mew/bin/
name=mew

# Giving Executable permission to the mew.sh file 
if [[ -f "./bin/mew.sh" ]]; then chmod +x ./bin/mew.sh; fi

old_mew_flag=false
# Creating folder structure for mew
if [[ -f $main_dir || -d $main_dir ]]; then 
    old_mew_flag=true
    rm -rf $main_dir
fi

mkdir -p $main_dir
mkdir -p "$main_dir/bin/"

if $old_mew_flag; then
    echo "Reinstalling mew..."
else 
    echo "Installing mew..."
fi

# Copying mew binary and library to main directory
cp -rf -p $main_executable $bin_target/$name
cp -rf -p $main_lib $main_dir

# Setting environment variables for mew 
bash_target=~/.bashrc
fish_target=~/.config/fish/config.fish
zsh_target=~/.zshrc
export_query='export PATH="$PATH:$HOME/.mew/bin/"' 

# Checking if SHELL available 
# Bash
if [[ -f $bash_target ]]; then 
    if ! grep -q "$export_query" $bash_target; then
        {
            echo -e "\n# Mew path"
            echo $export_query
        } >> $bash_target
    fi
fi
# Fish
if [[ -f $fish_target ]]; then 
    if ! grep -q "$export_query" $fish_target; then
        {
            echo -e "\n# Mew path"
            echo $export_query
        } >> $fish_target
    fi
fi
# Zsh 
if [[ -f $zsh_target ]]; then 
    if ! grep -q "$export_query" $zsh_target; then
        {
            echo -e "\n# Mew path"
            echo $export_query
        } >> $zsh_target
    fi
fi

echo "Installed..."