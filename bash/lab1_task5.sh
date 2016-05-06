#!/bin/bash
#Arguments: the directory name, the file name pattern (for example: '*.txt')

directory=$1
pattern=$2

echo "The arguments are: $@"
echo "The directory name: $directory"
echo "The file name pattern: $pattern"

files=$(find $directory -type f -name $pattern -print)
#echo $files

wc -l $files
