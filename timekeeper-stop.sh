#!/bin/bash
TIMEKEEPER_DIR=$(dirname -- $0)
TASKS_DIR="$TIMEKEEPER_DIR/tasks"

source "$TIMEKEEPER_DIR/displaySeconds.sh"

if ! [ -d $TASKS_DIR ]; then
    echo "No running tasks."
    exit 0
fi

for task in "$@"
do
    echo "Task '$task':"
    
    TASK_SECS="$TASKS_DIR/$task.secs"
    RUNNING_TASK="$TASKS_DIR/$task.running"
    
    if ! [ -f $TASK_SECS ]; then
        echo "  ERROR: Total seconds for $task in file $TASK_SECS not found"
    fi
    
    if ! [ -f $RUNNING_TASK ]; then
        echo "  Task $task is not running."
    fi

    TOTAL_SECS=`cat $TASK_SECS`
    START_TIME=`cat $RUNNING_TASK`
    END_TIME=`date +%s`
    ELAPSED_TIME=`expr $END_TIME - $START_TIME`
    TOTAL_SECS=`expr $TOTAL_SECS + $ELAPSED_TIME`

    echo "  Stopped after $(displaySeconds $ELAPSED_TIME)."
    echo "  Task total $(displaySeconds $TOTAL_SECS)."
    
    rm $RUNNING_TASK
    echo $TOTAL_SECS > $TASK_SECS

done
