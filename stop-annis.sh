#!/bin/bash
source ./bin/config.sh

export ANNIS_HOME=./annis-service-3.6.0
export PATH=$PATH:$ANNIS_HOME/bin

echo Stopping Annis...
annis-service.sh stop
echo Shutting down Tomcat....
sudo systemctl stop annis-frontend
