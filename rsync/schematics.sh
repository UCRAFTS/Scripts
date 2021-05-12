#!/bin/bash

SSH_PORT=22
SSH_USER="user"
SSH_HOST="localhost"
PATH_FROM="/data/folder/1"
PATH_TO="/data/folder/2"
ARGS="-avPI"

rm -r $PATH_TO/*
rsync $ARGS -e "ssh -p $SSH_PORT" $SSH_USER@$SSH_HOST:$PATH_FROM $PATH_TO
