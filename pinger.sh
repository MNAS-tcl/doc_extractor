#!/bin/bash

echo `date` > ping.txt
while true
do
    echo `date` >> ping.txt
    ping -n 1 n133905 >> ping.txt
    sleep 1;
done


