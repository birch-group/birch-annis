#!/bin/bash
source ./bin/config.sh

export ANNIS_HOME=./annis-service-3.6.0
export PATH=$PATH:$ANNIS_HOME/bin

echo Stopping Annis...
annis-service.sh stop
echo Shutting down Tomcat....
cd ${TOMCAT_DIR}/webapps/ROOT/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui && \
sudo mvn tomcat:shutdown
