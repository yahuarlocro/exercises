#!/bin/bash
#title           :05-number-user-processes-sorted.sh
#description     :This script checks all the processes running for the
#                :current user (USER env var) and prints out the processes
#                :in console. 
#                :Additionatly ask for a user input for sorting the processes
#                :output either by memory or CPU consumption, and print thei
#                :sorted list. Complementary asks additionally for user 
#                :input about how many processes to print. 
#author          :yahuarlocro
#date            :29-01-2024
#version         :0.1
#usage           :bash 05-number-user-processes-sorted.sh
#                :./05-number-user-processes-sorted.sh
#dependecies     :
#==============================================================================

set -e 

echo "Do you want to sort the values according to CPU or Memory"
read -p "Enter CPU or MEM: " SORT_VAR
read -p "How many processes do you want to get listd (Enter a number): " NUMBER_OUTPUT

echo ${SORT_VAR}
UPPERCASE_VAR=$(echo ${SORT_VAR} | awk '{ print toupper($0)}')

echo ${UPPERCASE_VAR}


if [[ ${UPPERCASE_VAR} == "CPU" ]]; then
    ps aux --sort -%cpu | grep ${USER} | head -n ${NUMBER_OUTPUT}
elif [[ ${UPPERCASE_VAR} == "MEM" ]]; then
    ps aux --sort -%mem | grep ${USER} | head -n ${NUMBER_OUTPUT}
else
    echo "Input value is wrong, please try again"
fi

