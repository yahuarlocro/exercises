# Task
Extend the previous script to ask additionally for user input about how many processes to print. Hint: use head program to limit the number of outputs. 

# Solution

```bash
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

```