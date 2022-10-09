#!/bin/bash

filesdir=$1
searchstr=$2

if [ -z ${filesdir} -o -z ${searchstr} ] 
then  
  echo "Incorrect parameter count"
  exit 1
elif [ ! -d ${filesdir} ]
then
  echo "${filesdir} does not exist"
  exit 1
else 
  count=`find ${filesdir} -type f 2> /dev/null | wc -l`
  matches=`grep -r ${searchstr} ${filesdir} | wc -l`
  echo "The number of files are ${count} and the number of matching lines are ${matches}"
  exit 0
fi  
