#!/bin/sh
# Script to find occurance of particular text specified at runtime in all the files within a directory


NUMBERFILE=0
MATCHEDLINES=0

if [ "$#" -eq 2 ]
then
    FILEDIR=$1
    SEARCHSTR=$2
else
    echo "Total number of arguments must be equal to 2."
    echo "Argument 1 : path to a directory in the file system."
    echo "Argument 2 : String to be search in all the files under the passed directory"
    exit 1
fi

if [ -d FILEDIR ]
then
    if [ -L FILEDIR ]
    then
        NUMBERFILE=`find ${FILEDIR} -type f | wc -l`
        MATCHEDLINES=`grep -rni ${SEARCHSTR} ${FILEDIR}/*`
        echo "The number of files are ${NUMBERFILE} and the number of matching lines are ${MATCHEDLINES}"
    fi
else
    echo "Provided path to directory does not exist"
    exit 1
fi

