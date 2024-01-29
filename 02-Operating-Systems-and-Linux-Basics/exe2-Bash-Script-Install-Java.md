# Task
Write a bash script using Vim editor that installs the latest java version and checks whether java was installed successfully by executing a java -version command.

After installation command, it checks 3 conditions:

- 1. whether java is installed at all
- 2. whether an older Java version is installed (java version lower than 11)
- 3. whether a java version of 11 or higher was installed

It prints relevant informative messages for all 3 conditions. Installation was successful if the 3rd condition is met and you have Java version 11 or higher available.

# Solution

- See file 02-install-java.sh

```bash
set -e 

sudo apt update

sudo apt -y install default-jre

sudo apt -y install default-jdk

JAVA=$(java --version)

if [[ ${JAVA} ]]; then
    echo "#######################################"
    echo "#######################################"
    echo "#######################################"
    echo ${JAVA}
    echo "Java is installed"
    echo "#######################################"
    echo "#######################################"
    echo "#######################################"
fi

VERSION=$(java --version | awk -F' ' 'NR==1 {print $2}' | awk -F'.' 'NR==1 {print $1}')

    
if [[ ${VERSION} -gt 11 ]]; then
    echo "#######################################"
    echo "#######################################"
    echo "#######################################"
    echo ${VERSION}
    echo "Java is newer than 11"
    echo "#######################################"
    echo "#######################################"
    echo "#######################################"
fi


VERSION_FULL=$(java --version | awk -F' ' 'NR==1 {print $2}')

if [[ ${VERSION_FULL}  ]]; then
    echo "#######################################"
    echo "#######################################"
    echo "#######################################"
    echo "Java installed version is ${VERSION_FULL}"
    echo "#######################################"
    echo "#######################################"
    echo "#######################################"
fi

```