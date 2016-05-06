#!/bin/bash
#The result of this task is saved in file named result.txt.

files=$(ls | grep -E "^localhost_access_log.[[:digit:]]{4}-02-[[:digit:]]{2}.txt$")

for file in $files
do
	#save all of the actions from the file in actions.txt
	cut -d'"' -f2 $file | sort | uniq > actions.txt	
	
	#print date
	year=$(echo $file | cut -d'-' -f1 | cut -d'.' -f2)
	month=$(echo $file | cut -d'-' -f2)
	day=$(echo $file | cut -d'-' -f3 | cut -d'.' -f1)
	echo "datum: $day-$month-$year" >> result.txt
	echo -------------------------------------------------- >> result.txt

	#count how many times the action appears
	while read action
	do
		number_of_actions=$(grep "$action" $file | wc -l)
		temp="  $number_of_actions : $action"
		echo "$temp" >> temp.txt
	done <actions.txt

	#sort actions and save them to result.txt
	sort -nr temp.txt >> result.txt
done

rm actions.txt
rm temp.txt
