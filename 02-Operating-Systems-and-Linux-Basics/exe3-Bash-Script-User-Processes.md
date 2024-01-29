# Task

Write a bash script using Vim editor that checks all the processes running for the current user (USER env var) and prints out the processes in console. Hint: use ps aux command and grep for the user.

# Solution


see file 03-user-processes.sh

```
set -e 

ps aux | grep ${USER}

```