#!/bin/bash
#title           :09-node-app-with-service-user.sh
#description     :This script installs nodejs, and npm. Also downloads an 
#                :application. Then it sets up the needed environment, installs
#                :needed packages, and runs the application.
#                ;Checks app sucessful start and shows app running process
#                :Asks for a log directory, checks if exits. If not, directory
#                :will be created and env_var will be set
#                :run the node app as a different user
#author          :yahuarlocro
#date            :02-02-2024
#version         :0.1
#usage           :bash 09-node-app-with-service-user.sh
#                :./09-node-app-with-service-user.sh
#dependecies     :
#==============================================================================

set -e

sudo apt update

sudo apt install -y nodejs


echo "################################################"
echo "################################################"
echo "################################################"
echo "Node is installed and version is the following:"
echo $(node -v)
echo "################################################"
echo "################################################"
echo "################################################"

sudo apt install -y npm

wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz

tar zxvf bootcamp-node-envvars-project-1.0.0.tgz

read -p "Enter absolute path for storing logs: " LOG_DIR

if [[ -d $LOG_DIR ]]; then
    echo ${LOG_DIR}
    echo "directory exists"
    export LOG_DIR=${LOG_DIR}
    echo "environment variable was set"
elif [[ ! -d $LOG_DIR ]]; then
    echo "directory does not exist"
    echo "creating directory"
    mkdir ${LOG_DIR}
    echo "directory was created"
    export LOG_DIR=${LOG_DIR}
    echo "environment variable was set"

fi

export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

cd package

npm install

npm audit fix --force

read -p "Enter what is the sudo password: " SUDO_PASS

echo "${SUDO_PASS}" | sudo -S  useradd -c 'service user node js' -l -M -N -s /usr/sbin/nologin myapp


echo "${SUDO_PASS}" | sudo -S -u myapp node server.js &

sleep 3

PSID=$(pidof node)

echo "${PSID}"

PORT=$(ss -tulpn | grep "${PSID}" | awk -F' ' '{printf $5}')
# PORT=$(ss -tulpn | awk -v psid="${PSID}"  '$0 ~ psid {print $5}')
echo "${PORT}"


if [[ -n ${PORT} ]]; then
    echo "################################################"
    echo "################################################"
    echo "################################################"
    echo "app is running on port"
    echo ${PORT}
    echo "################################################"
    echo "################################################"
    echo "################################################"

fi




