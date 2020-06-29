#!/bin/bash

function usage() {
   echo "Usage : $1 [-f <filename>][-s <string>][-h | help]"
}

if [ "$#" -eq 0 ]
then
   usage
fi

while getopts f:s:h opt ; do
case $opt in
     f)
       FILE=${OPTARG}
       if [ -f $FILE ]
       then
         echo `base64 $FILE`
       else
         echo "file doesnot exists"
       fi
       ;;
     s)
        STRING=${OPTARG}
        echo $STRING | base64
        ;;
     h)
        usage
        ;;
     *)
        usage
        echo "Invalid argument"
esac
done
