#!/bin/bash
#title           :02-install-java.sh
#description     :This script installs the latest java version and checks 
#                :whether java was installed successfully by executing a 
#                :java -version command.
#author          :yahuarlocro
#date            :29-01-2024
#version         :0.1
#usage           :bash 02-install-java.sh
#                :./02-install-java.sh
#dependecies     :
#==============================================================================

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
