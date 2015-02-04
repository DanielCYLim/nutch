#!/bin/bash
#
if [ -z "$NUTCH_HOME" ]
then
  NUTCH_HOME=.
  echo runbot: $0 could not find environment variable NUTCH_HOME
  echo runbot: NUTCH_HOME=$NUTCH_HOME has been set by the script 
else
  echo runbot: $0 found environment variable NUTCH_HOME=$NUTCH_HOME 
fi
# Arguments for rm and mv
RMARGS="-rf"
MVARGS="--verbose"
#
$NUTCH_HOME/bin/nutch updatedb crawl/crawldb crawl/segments/* -filter -normalize
#
$NUTCH_HOME/bin/nutch mergesegs crawl/MERGEDsegments crawl/segments/*
if [ "$safe" != "yes" ]
then
  rm $RMARGS crawl/segments
else
  rm $RMARGS crawl/BACKUPsegments
  mv $MVARGS crawl/segments crawl/BACKUPsegments
fi

mv $MVARGS crawl/MERGEDsegments crawl/segments