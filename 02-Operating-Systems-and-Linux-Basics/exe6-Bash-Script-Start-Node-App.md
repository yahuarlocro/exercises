# Task

Write a bash script with following logic: 

- Install NodeJS and NPM and print out which versions were installed
- Download an artifact file from the URL: [https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz](https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz). Hint: use curl or wget
    - Unzip the downloaded file
    - Set the following needed environment variables: APP_ENV=dev, DB_USER=myuser, DB_PWD=mysecret
    - Change into the unzipped package directory
    - Run the NodeJS application by executing the following commands:  npm install and node server.js

Notes:

- Make sure to run the application in background so that it doesn't block the terminal session where you execute the shell script
- If any of the variables is not set, the node app will print error message that env vars is not set and exit
- It will give you a warning about LOG_DIR variable not set. You can ignore it for now.


# Solution

```bash
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
```