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
    echo -e "\e[33mReinstalling mew...\e[0m"
else 
    echo -e "\e[33mInstalling mew...\e[0m"
fi

# Copying mew binary and library to main directory
cp -rf -p $main_executable $bin_target/$name
cp -rf -p $main_lib $main_dir

# Setting environment variables for mew 
export_query='export PATH="$PATH:$HOME/.mew/bin/"' 
shell_targets=(~/.bashrc ~/.config/fish/config.fish ~/.zshrc ~/.kshrc ~/.tcshrc ~/.cshrc)

# Checking if SHELL available 
for shell_target in ${shell_targets[@]}; do
    if [[ -f $shell_target ]]; then 
        if ! grep -q "$export_query" $shell_target; then
            {
                echo -e "\n# mew path"
                echo $export_query
            } >> $shell_target
        fi
    fi
done

echo -e "\e[32mInstalled...\e[0m"