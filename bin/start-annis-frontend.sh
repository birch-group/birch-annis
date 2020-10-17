#!/bin/bash
source ./bin/config.sh

echo Starting Tomcat...

# # Check if java is running at port :8080
# if [[ -n $(ps -ef | egrep '\-Dannis\.home\=annis\-service') ]]; then
#   echo Killing Java at port 8080...
#   annis_pid=$(ps -ef | egrep '\-Dannis\.home\=annis\-service' | awk '{print $2}')
#   sudo kill -9 ${annis_pid}
# fi
#
#
#
cd ${TOMCAT_DIR}/webapps/ROOT/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui && \
sudo mvn package

cd ${TOMCAT_DIR}/webapps/ROOT/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui && \
sudo nohup mvn tomcat:run-war &
