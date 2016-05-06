#!/bin/bash
#Arguments: the name of directory with photos, the name of directory in which will be created the subdirectories by months.

source=$1
destionation=$2

photos=$(ls "$1")

for photo in $photos
do
	date=$(stat -c %y "$source/$photo" | cut -d' ' -f1)
	year=$(echo $date | cut -d'-' -f1)
	month=$(echo $date | cut -d'-' -f2)
	
	subdirectory="$destionation/$year-$month"

	if [ ! -d "$subdirectory" ]; then
		mkdir "$subdirectory"
		echo "Subdirectory $subdirectory created."
	fi

	mv "$source/$photo" $subdirectory
	echo "File $photo moved to subdirectory $subdirectory."
done
