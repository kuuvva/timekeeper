# Timekeeper

Measure time spent on different tasks with Bash shell.

## Tasks

Task is an activity whose elapsed time is measured. Tasks have two states, either running or stopped. Running task is a currently ongoing task, and stopped task is not active but its total elapsed time has been saved in a file.

## `timekeeper-start.sh`
A new time measurement on a task can be started with the script `timekeeper-start.sh` by providing one or more task names as arguments. Script starts to measure time on new tasks from 0 seconds or adds up to time measured on  previously created tasks. Task's state changes to running which is indicated with a file named after the task and having `.running` file extension. Running task file contains task's starting time as seconds since Epoch (1970-01-01 00:00 UTC). Script does nothing for a requested task that is already running.

## `timekeeper-stop.sh`
Running task can be stopped with `timekeeper-stop.sh` script by providing one or more task names as arguments. Running file's task start time is substracted from the current date value. The result is then added with the second value in task's `.secs` file and the `.secs` file contents is then replaced with the total seconds value. Script does nothing for a requested task if the task is not running.

## Example

```bash
# Start measuring studying session with tasks study and kotlin.

./timekeeper-start.sh study kotlin


# Stopping one task and starting another one.

./timekeeper-stop.sh kotlin

./timekeeper-start.sh linear-algebra


# Ending studying session, stopping several tasks.

./timekeeper-stop.sh study linear-algebra


# List name, state and  elapsed time of all tasks.

./timekeeper-tasks.sh
```
