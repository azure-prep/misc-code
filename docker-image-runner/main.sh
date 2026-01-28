#!/bin/bash

./config.sh --url https://github.com/azure-prep --token ${TOKEN} --unattended --name ${NAME} --work _work--replace
exec ./run.sh