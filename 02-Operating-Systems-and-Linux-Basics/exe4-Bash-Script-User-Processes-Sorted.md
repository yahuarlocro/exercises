# Task


# Solution

see file 04-user-processes-sorted.sh

```bash
set -e 

echo "Do you want to sort the values according to CPU or Memory"
read -p "Enter CPU or MEM: " SORT_VAR

echo ${SORT_VAR}
UPPERCASE_VAR=$(echo ${SORT_VAR} | awk '{ print toupper($0)}')

echo ${UPPERCASE_VAR}


if [[ ${UPPERCASE_VAR} == "CPU" ]]; then
    ps aux --sort %cpu | grep ${USER}
elif [[ ${UPPERCASE_VAR} == "MEM" ]]; then
    ps aux --sort %mem | grep ${USER}
else
    echo "Input value is wrong, please try again"
fi

```