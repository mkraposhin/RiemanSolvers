#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Number of arguments less then 1"
    exit
fi

rm -rf exact.out
rm -rf exact.ini
ln -s $1/exact.ini
./toro-fort

#
#END-OF-FILE
#


