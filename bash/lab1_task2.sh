#!/bin/bash
grep -iE 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt

grep -ivE 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt

grep -rE "\<[[:upper:]]{3}[[:digit:]]{6}\>" ~/projekti

find . -mtime -14 -a -mtime +7 -ls

for i in {1..15}; do echo $i; done
