#!/bin/bash
#
URL=$1
#
echo $URL | bin/nutch org/apache/nutch/net/URLFilterChecker -filterName org.apache.nutch.urlfilter.regex.RegexURLFilter
