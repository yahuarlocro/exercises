# Task
Extend the script to accept a parameter input log_directory: a directory where application will write logs.

The script will check whether the parameter value is a directory name that doesn't exist and will create the directory, if it does exist, it sets the env var LOG_DIR to the directory's absolute path before running the application, so the application can read the LOG_DIR environment variable and write its logs there.

Note:

- Check the app.log file in the provided LOG_DIR directory.


# Solution

```bash
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
```