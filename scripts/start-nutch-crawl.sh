#!/bin/sh
#
home_dir=/home/lchungyo/Development/workspaces/nutch
target_name=name_of_folder
#
session_name=nutch-${target_name}
#
cd ${home_dir}/${target_name}
#
number_of_files=`ls file | wc -l`
echo "Number of files in ${home_dir}/${target_name}/file : ${number_of_files}"
echo
#
echo "Checking if a screen session for ${session_name} is still running:"
screen -list | grep ${session_name}

if [ $? -eq 0 ]
then 
	echo "An existing screen session for ${session_name} is found. Do not start new crawl session."
	exit
else 
	echo "No screen session for ${session_name} is running. Continue to start crawl session."
fi	
#
echo "Starting screen session for nutch crawling with session name ${session_name}"
#
screen -L -dmS ${session_name} ./crawl-bot.sh
#
echo "Screen session started:"
screen -list | grep ${session_name}
