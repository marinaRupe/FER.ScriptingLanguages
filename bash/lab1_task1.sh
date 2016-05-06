#!/bin/bash
probe="This is probe"

echo $probe

list_of_files=$(echo *)
#list_of_files=$(ls)
echo $list_of_files

probe3="$probe. $probe. $probe."
#probe3=`for ((i=0;i<3;i++)); do echo -n "$probe. "; done`

a=4;b=3;c=7
d=$((($a+4)*($b%$c)))

word_count=$(cat $(ls *.txt) | wc -w)

ls ~

cut -d':' -f 1,6,7 /etc/passwd

ps -ef | tail -n +2 | sed -r 's/[[:blank:]]+/ /g' | cut -d' ' -f1,2,8
