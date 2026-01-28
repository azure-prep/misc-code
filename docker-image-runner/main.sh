#!/bin/bash

if [ -z ${TOKEN} ];
then echo "Set TOKEN variable to github token"
exit 1
fi

if [ -z ${NAME} ];
then echo "Set NAME variable to github runner name"
exit 1
fi

./config.sh --url https://github.com/azure-prep --token ${TOKEN} --unattended --name ${NAME} --work _work--replace
exec ./run.sh