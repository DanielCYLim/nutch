#!/bin/bash
#
# Usage: archive-old-files archive-file-name
#
# e.g. archive-old-files old-files-20140101
#  The archive file to be created will be old-files-20140101
# 
old_files_name=$1
#
date
echo "Starting ..."
#
mkdir ${old_files_name}
mv crawl* ${old_files_name}/
mv file ${old_files_name}/
mv logs ${old_files_name}/
mv screen*.log ${old_files_name}/
#
echo "Starting tar bz2 process for ${old_files_name} ... "
tar -jcf ${old_files_name}.tar.bz2 ${old_files_name}/ 
#
echo "Deleting ${old_files_name} ..."
rm -fr ${old_files_name}
#
date
echo "Process ended."