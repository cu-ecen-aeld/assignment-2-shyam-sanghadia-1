#!/bin/sh
# This file creates and write string provided at run time. IF file / file path exists it will overwrite the file.


# Check for the number of required arguments passed at run time.
# Number of arguments must be 2.
if [ "$#" -eq 2 ]
then
    WRITEFILE=$1
    echo ${WRITEFILE}
    WRITESTR=$2
    echo ${WRITESTR}
else
    echo "Required arguments missing"
    exit 1
fi

# Check if file exist at the given location
# If not then create one.
if [ ! -f ${WRITEFILE} ]
then
    # Check if the directory in present. If not create one.
    DIR=$(dirname ${WRITEFILE})
    if [ ! -d ${DIR} ]
    then
        echo "Creating directory as it does not exists"
        mkdir -p ${DIR}
    else
        echo "Creating new file as it does not exists"
        touch ${WRITEFILE}
    fi
    if [ "$?" -ne 0 ]
    then
        echo "Error in creating file"
        exit 1
    fi
fi

# write to file the given string
echo ${WRITESTR} | tee 2>&1 ${WRITEFILE}

if [ "$?" -ne 0 ]
then
    echo "Error in wirting file"
    exit 1
fi
