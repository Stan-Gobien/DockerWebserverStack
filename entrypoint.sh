#!/bin/bash
echo Entrypoint.sh start
set -e

echo Update script files from Github
#You can disable this for security reasons or use your own repo with script files

curl -o  /bin/entrypoint.sh https://raw.githubusercontent.com/Stan-Gobien/DockerWebserverStack/AresSvr/entrypoint.sh --no-progress-meter
curl -o  /bin/dependencies.sh https://raw.githubusercontent.com/Stan-Gobien/DockerWebserverStack/AresSvr/dependencies.sh --no-progress-meter
chmod +x /bin/entrypoint.sh && chmod +x /bin/dependencies.sh

## Running passed command via exec
if [[ "$1" ]]; 
then
        eval "$@"
else
        sleep 5
        FILE=/var/.dependenciesfinished
        if [ -f "$FILE" ]
        then
            echo "Dependencies already installed. $FILE exists."
        else
            echo "Running dependencies installation via dependencies.sh"
            /bin/dependencies.sh
        fi
        sleep 5
fi
php-fpm
