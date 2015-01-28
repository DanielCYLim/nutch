#!/bin/bash
while true
do
	date
	echo "Starting crawl-bot.sh"
	/home/lchungyo/Development/workspace-nutch/crawl-bot.sh
	#
	echo "sleeping for 1 hour"
	sleep 3600
done