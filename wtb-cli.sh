#!/bin/bash

INPUT_TIME=""
INPUT_DATE=""
INPUT_TZS=""
BASE_TZ=""

function time_line() {
    BASE_TIME=$(TZ=$BASE_TZ date --date "$INPUT_TIME $INPUT_DATE" +"%s")
    TIME=$(TZ=$INPUT_TZ date --date="@$BASE_TIME" +"%m-%d %H:%M")
    TIME_HOUR=$(TZ=$INPUT_TZ date --date="@$BASE_TIME" +"%H") # handle 00 with as it produces -1
    UTC_DIFF=$(TZ=$INPUT_TZ date --date="@$BASE_TIME" +"%:z")
    BEFORE_HOUR=$(expr $TIME_HOUR - 1)
    echo -en "$UTC_DIFF "
    if [[ "$INPUT_TZ" == *"/"* ]]
    then
        echo -en $INPUT_TZ"\t"
    else
        echo -en $INPUT_TZ"\t\t"
    fi
    echo -en $TIME"\t"
    DARK_GRAY_BACKGROUND="\e[40m"
    DEEP_BLUE="\e[34m"
    LIGHT_BLUE="\e[94m"
    LIGHT_YELLOW="\e[93m"
    DEEP_YELLOW="\e[33m"
    RED="\e[31m"
    GREEN="\e[32m"
    NOCOLOR="\e[0m"
    
    for i in $(eval echo {$TIME_HOUR..24}) $(eval echo {00..$BEFORE_HOUR})
    do
        if [[ $((10#$i)) -le 5 ]]
        then
            COLOR=$DEEP_BLUE
        elif [[ $((10#$i)) -le 7 ]]
        then
            COLOR=$LIGHT_BLUE
        elif [[ $((10#$i)) -le 17 ]]
        then
            COLOR=$DEEP_YELLOW
        elif [[ $((10#$i)) -le 21 ]]
        then
            COLOR=$LIGHT_BLUE
        elif [[ $((10#$i)) -le 23 ]]
        then
            COLOR=$DEEP_BLUE
        fi

        if [[ $i != $TIME_HOUR ]]
        then
            echo -en $DARK_GRAY_BACKGROUND$COLOR$i$NOCOLOR"  "
        else
            echo -en "|"$DARK_GRAY_BACKGROUND$COLOR$i$NOCOLOR"| "
        fi
    done
    echo
}

time_line UTC
time_line CET
time_line Asia/Kolkata
time_line UTC-06
time_line Asia/Dhaka

