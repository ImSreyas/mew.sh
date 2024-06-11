file_content="../packages.txt"
mapfile -t packages < "$file_content"
for package in "${packages[@]}"; do 
	echo "$package"
done
while true; do 
	read -p "Are you sure to install (y/n) : " confirmation
	if [ "$confirmation" = "y" ]; then
		sudo dnf install "${packages[@]}"
		exit
	elif [ "$confirmation" = "n" ]; then 
		echo "No packages installed..."
		exit
	else 
		echo "Invalid option..."
	fi
done
