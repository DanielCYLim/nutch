#!/bin/bash
#
# Remove index pages
#
# eng.mod.gov.cn
#
find . -type f -name "*index*.htm" -exec rm -f {} \;
find . -type f -name "*node*.htm" -exec rm -f {} \;
#
# english.chinamil.com.cn
#
find . -type f -name "*headlines.htm" -exec rm -f {} \;