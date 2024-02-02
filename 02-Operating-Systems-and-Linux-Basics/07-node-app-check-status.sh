#!/bin/bash
#title           :07-node-app-check-status.sh
#description     :This script installs nodejs, and npm. Also downloads an 
#                :application. Then it sets up the needed environment, installs
#                :needed packages, and runs the application.
#                ;Checks aoo sucessful start and shows app running process
#author          :yahuarlocro
#date            :30-01-2024
#version         :0.1
#usage           :bash 07-node-app-check-status.sh
#                :./07-node-app-check-status.sh
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

export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

cd package

npm install

npm audit fix --force

node server.js &

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




