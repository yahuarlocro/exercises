#!/bin/bash
#title           :03-user-processes.sh
#description     :This script checks all the processes running for the
#                :current user (USER env var) and prints out the processes
#                :in console. 
#author          :yahuarlocro
#date            :29-01-2024
#version         :0.1
#usage           :bash 03-user-processes.sh
#                :./03-user-processes.sh
#dependecies     :
#==============================================================================

set -e 

ps aux | grep ${USER}

