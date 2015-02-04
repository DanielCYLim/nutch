#!/bin/bash
#
URL=$1
#
#echo $URL | bin/nutch org/apache/nutch/net/URLNormalizerChecker -normalizer org.apache.nutch.net.urlnormalizer.regex.RegexURLNormalizer
#
echo $URL | bin/nutch org/apache/nutch/net/URLNormalizerChecker
#
#NUTCH_HOME=/home/lchungyo/git/nutch/runtime/local
#
#$NUTCH_HOME/bin/nutch plugin urlnormalizer-regex org.apache.nutch.net.urlnormalizer.regex.RegexURLNormalizer $URL
#
bin/nutch plugin urlnormalizer-regex org.apache.nutch.net.urlnormalizer.regex.RegexURLNormalizer $URL
