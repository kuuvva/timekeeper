#!/bin/bash

TIMEKEEPER_DIR=$(dirname -- $0)
TASKS_DIR="$TIMEKEEPER_DIR/tasks"
START_TIME=$(date +%s)

# Check if tasks folder exists

if ! [ -d $TASKS_DIR ]; then
    mkdir $TASKS_DIR
    echo "Created $TASKS_DIR directory."
fi


# Start tasks

for task in "$@"
do
    echo "Task '$task':"

    # Create .secs file if it doesn't exist

    TASK_SECS="$TASKS_DIR/$task.secs"
    if ! [ -f $TASK_SECS ]; then
        echo 0 > $TASK_SECS
    fi

    
    # Check if task is already running. Create .running file

    RUNNING_TASK="$TASKS_DIR/$task.running"
    if ! [ -f $RUNNING_TASK ]; 
    then
        echo $START_TIME > $RUNNING_TASK
	echo "  Started."
    else
        echo "  Is already running."
    fi
done
