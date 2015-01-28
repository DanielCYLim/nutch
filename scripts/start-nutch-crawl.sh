#!/bin/sh
session_name=$1
#
echo "Starting screen session for nutch crawling with session name nutch-${session_name}"
#
#screen -L -dmS nutch-${session_name} bin/nutch crawl urls -depth 50000 -topN 50000 -threads 128
#
screen -L -dmS nutch-${session_name} /home/lchungyo/Development/workspace-nutch/endless-crawl-bot.sh
