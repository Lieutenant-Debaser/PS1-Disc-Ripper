#!/bin/bash

# Variables used in script
mount_point="undefined"
output_file="undefined"

# Determine the number of arguments passed in and react accordingly
if [[ $# -lt 1 ]]
then
	echo " PS1-Rip: Missing arguments! Use 'help' for more information."
elif [[ $# -eq 1 ]]
then
	if [[ $1 = "help" ]]
	then
                echo -e "\n PS1-Rip v. 1.0"
                echo " Usage:"
                echo "    PS1-Rip [Disc Drive] [Output Name] "
                echo "    Disk Drive: The location of the drive itself (not the mounted disc)."
                echo -e "    Output Name: The name of the output file (optional).\n"
		exit 0
	elif [[ $1 = "install" ]]
	then
		echo -e "\n"
		sudo apt update
		sudo apt install cdrdao
		echo -e "\n"
		exit 0
	else
		mount_point=$1
		output_file="PS1Rip"
	fi
elif [[ $# -eq 2 ]]
then
	mount_point=$1
	output_file=$2
else
	echo -e "\n PS1-Rip: Too many arguments passed in! Use 'help' for more information.\n"
	exit $#
fi

# Read disc based settings set above
umount $mount_point

echo -e "\n PS1-Rip: Reading disc...\n"
mkdir $output_file
cd $output_file
cdrdao read-cd --read-raw --read-subchan rw_raw --datafile "$output_file.bin" --device $mount_point --driver generic-mmc-raw "$output_file.toc"
echo -e "\n PS1-Rip: Disc read done!"
echo -e "\n PS1-Rip: Creating .toc and .cue files..."
toc2cue "$output_file.toc" "$output_file.cue"
echo  -e "\n PS1-Rip: .toc and .cue creation done!"
echo -e "\n PS1-Rip: Process complete! It is now safe to remove the disc.\n"
