#!/bin/bash
source ./bin/config.sh

export ANNIS_HOME=./annis-service-3.6.0
export PATH=$PATH:$ANNIS_HOME/bin

annis-service.sh stop
sudo systemctl stop tomcat
