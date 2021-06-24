#!/bin/bash

usage()
{
    echo "Usage: $0 [start_address end_address]"
    exit 1
}

if (( $# == 1 || $# > 2 ))
then
    usage
elif (( $# == 2 ))
then
    REGEX='^[1-9][0-9]{,2}[.]([0-9]{1,3}[.]){2}[0-9]{1,3}$'
    BEGIN=$1
    END=$2

    if ! [[ $BEGIN =~ $REGEX && $END =~ $REGEX ]]
    then
        usage
    elif [[ ${BEGIN%[0-9]*} == ${END%[0-9]*} ]]
    then
        SUBNET=${BEGIN%[0-9]*}
        START=${BEGIN##*.}
        STOP=${END##*.}
    else
        echo "First three octets must match when entering range!!"
        exit 2
    fi
else
    START=1
    STOP=254
    SUBNET=$(/sbin/ifconfig | awk '!/lo/{print gensub(/[^:]*:|[^.]+$/,"","g",$7)}' RS="")
fi

#in case you wish to kill it
trap 'exit 3' 1 2 3 15

while (( START <= STOP ))
do
    ping -c 1 $SUBNET$START
    ((START++))
done