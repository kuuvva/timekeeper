#!/bin/bash
val=0
for task in "$@"
do
    echo "$val$task"
    val=`expr $val + 1`
done
