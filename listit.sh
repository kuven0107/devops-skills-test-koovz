#!/bin/bash
count=5
for i in $(seq $count);
do
#Create a file called directories.list that contains the directory names only of the current directory.
#	find $1 -mindepth 1 -maxdepth 1 -type d >  directories.list # Specify path
	find -mindepth 1 -maxdepth 1 -type d >  directories.list #Current working direcoty
#Add a line at the beginning of the directories.list file that reads "line one's line".
	sed -i -e '1s/^/line one\x27s line\n/' directories.list
#Output the first three lines of directories.list on the console.
	head -3 directories.list
done


