#!/bin/bash
#Bonus task: For every letter (case insensitive) and digit count how many words from given dictionary start with it. Sort the print descending.
#Argument: name of dictionary file


file="$1"
number_of_arguments=$#

if [ $number_of_arguments -ne 1 ]; then
	echo "Enter just one argument: the name of dictionary file!"

elif [ ! -f $file ]; then
	echo "$file is not file!"

else
	for x in {a..z}
	do
		counter=$(grep -iE "^${x}" "$file" | wc -l)
		echo "$counter $x" >> words.txt
	done

	for x in {1..9}
	do
		counter=$(grep -iE "^${x}" "$file" | wc -l)
		echo "$counter $x" >> words.txt
	done

	sort -rn words.txt
	rm words.txt
fi

