#!/bin/bash

TIMEKEEPER_DIR=$(dirname -- $0)
TASKS_DIR="$TIMEKEEPER_DIR/tasks"

source displaySeconds.sh
if [ -z "$(ls $TASKS_DIR/*.secs)" ]; then
    echo "No tasks to show."
    exit 0
fi

for task in $TASKS_DIR/*.secs ; do
    BASE_NAME=$(basename -- $task)
    TASK_NAME=${BASE_NAME%.*}
    RUNNING="$TASKS_DIR/$TASK_NAME.running"

    TOTAL=`cat $task`

    echo "Task '$TASK_NAME':"

    if [ -f $RUNNING ]; then
        START_TIME=`cat $RUNNING`
	END_TIME=`date +%s`
	ELAPSED=`expr $END_TIME - $START_TIME`

	TOTAL=`expr $ELAPSED + $TOTAL`
    fi
    
    echo "  Total time `displaySeconds $TOTAL`."
    if [ -f $RUNNING ]; then
        echo "  Running..."
    fi
done


