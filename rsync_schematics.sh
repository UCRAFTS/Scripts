#!/bin/bash

SSH_PORT=22
SSH_USER="user"
SSH_HOST="localhost"
PATH_FROM="/data/folder/a"
PATH_TO="/data/folder/b"
ARGS="-avPI"

rm -r $PATH_TO/*
rsync $ARGS -e "ssh -p $SSH_PORT" $SSH_USER@$SSH_HOST:$PATH_FROM $PATH_TO
