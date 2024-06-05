# actual_file="../packages.txt"
# temp_file="copy.txt"
# dnf history userinstalled | tail -n +2 > $temp_file
# if ! cmp -s $actual_file $temp_file; then
# 	diff --color=always $actual_file $temp_file
# 	echo 
# 	while true; do
# 		echo -n "Do you want to update? (y/n): "
# 		read confirmation
		
# 		if [ "$confirmation" = "y" ]; then
# 			cp $temp_file $actual_file
# 			echo "Packages updated..."
# 			break
# 		elif [ "$confirmation" = "n" ]; then 
# 			echo "No changes are done..."
# 			break
# 		else 
# 			echo "Invalid option..."
# 		fi
# 	done
# else 
# 	echo "Already upto date..."
# fi
# rm copy.txt

bash_sync() {
    if test -f $bash_target; then
        while true; do 
            read -p "Do you want to backup bash config file to dotfiles? (y/n) : " confirmation 
            case $confirmation in 
                y)
                    cp $bash_target $final_target 
                    echo "Bash config file copied to $final_target"
                    break 
                    ;;
                n)
                    echo "No changes are made..."
                    break
                    ;;
                *)
                    echo "Invalid input..."
                    ;;
            esac
        done
    else 
        echo "Bash file not found..."
    fi
}