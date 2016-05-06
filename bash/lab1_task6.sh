#!/bin/bash
#Arguments: the list of files, the directory where files have to be copied

number_of_files=$(($#-1))
directory="${!#}"

#if the given directory does not exist, create it
if [ ! -d "$directory" ]; then
	mkdir "$directory"
	echo "Directory $directory created."
fi

#copy files
files_copied=0;
for ((i=1; i<= $number_of_files; i++))
do
	if [ ! -e ${!i} ]; then
		echo "File ${!i} does not exist!"
	elif [ ! -r ${!i} ]; then
		echo "File ${!i} is not readable!"
	else
		cp ${!i} $directory
		files_copied=$((files_copied+1))
	fi
done

echo "$files_copied files copied to directory $directory."
