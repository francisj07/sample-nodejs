#!/bin/bash

REMOTE_HOST=""
REMOTE_USER=""
SSH_KEY=""

SSH_COMMAND="if [ -f /etc/os-release ]; then echo 'Linux'; elif [ -f /etc/redhat-release ]; then echo 'Linux'; elif [ -f /etc/lsb-release ]; then echo 'Linux'; else echo 'Windows'; fi"

OS_TYPE=$(ssh -i $SSH_KEY $REMOTE_USER@$REMOTE_HOST "$SSH_COMMAND")

if [[ "$OS_TYPE" == "Linux" ]]; then
    echo "The remote server is running Linux."
elif [[ "$OS_TYPE" == "Windows" ]]; then
    echo "The remote server is running Windows."
else
    echo "Could not determine the operating system."
fi
