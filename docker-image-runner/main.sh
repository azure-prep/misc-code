#!/bin/bash

./config.sh --url https://github.com/azure-prep --token ${TOKEN} --unattended --name ${NAME} --replace
exec ./run.sh

#sudo ./svc.sh install
#sudo ./svc.sh start