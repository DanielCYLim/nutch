#!/bin/bash
#
for year in 2014
do
#
  echo '##start: year '${year}
  #
  for month in 05 04 03
  do
  #
    #
    echo '#start: month '${year}-${month}
    #
    for day in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
    do
      echo http://www.thejakartapost.com/archive/all/${year}-${month}-${day}
    done
    #
    echo '#end: month '${year}-${month}
    #
  done
  echo '##end: year '${year}
#  
done
#
#
exit
#
#
#----------------------------------------------------------------------------------------------------------
#
for year in 2013 2012 2011 2010 2009 2008 2007
do
#
  echo '##start: year '${year}
  #
  for month in 12 11 10 09 08 07 06 05 04 03 02 01
  do
  #
    #
    echo '#start: month '${year}-${month}
    #
    for day in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
    do
      echo http://www.thejakartapost.com/archive/all/${year}-${month}-${day}
    done
    #
    echo '#end: month '${year}-${month}
    #
  done
  echo '##end: year '${year}
#  
done
