#!/bin/bash
writefile=$1
writestr=$2

if [ -z ${writefile} -o -z ${writestr} ]
then 
  echo "Incorrect argument count."
  exit 1
else 
  dir=`echo ${writefile} | sed -r "s/(.+)\/.+/\1/"`
  mkdir -p ${dir}
  touch ${writefile}
  if [ $? -ne 0 ]
  then
    echo "Could not create file ${writefile}."
    exit 1
  fi  
  echo ${writestr} > ${writefile}
fi 
