#!/bin/bash
#title           :06-start-node-app.sh
#description     :This script installs nodejs, and npm. Also downloads an 
#                :application. Then it sets up the needed environment, installs
#                :needed packages, and runs the application
#author          :yahuarlocro
#date            :30-01-2024
#version         :0.1
#usage           :bash 06-start-node-app.sh
#                :./06-start-node-app.sh
#dependecies     :
#==============================================================================

set -e 

sudo apt update

sudo apt install nodejs


echo "################################################"
echo "################################################"
echo "################################################"
echo "Node is installed and version is the following:"
echo $(node -v)
echo "################################################"
echo "################################################"
echo "################################################"

sudo apt install npm

wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz

tar zxvf bootcamp-node-envvars-project-1.0.0.tgz

export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

cd package

npm install

node server.js &




