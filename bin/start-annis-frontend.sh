#!/bin/bash
source ./bin/config.sh

echo Starting Tomcat...

# Check if java is running at port :8080
# Not really sure why this holds up tomcat sometimes
# Maybe left from lingering process?
# Look into ways other than mvn:tomcat shutdown to stop tomcat
if [[ -n $(lsof -i :8080 | egrep 'java') ]]; then
  echo Killing Java at port 8080...
  java_pid=$(lsof -i :8080 | egrep 'java' | awk '{print $2}' | tail -1)
  sudo kill -9 ${java_pid}
fi

# Set ${TOMCAT_PASSWORD} and ${TOMCAT_USERNAME} with actual values in pom.xml
sudo sed -i "s/{TOMCAT_PASSWORD}/${TOMCAT_PASSWORD}/g" ${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/pom.xml
sudo sed -i "s/{TOMCAT_USERNAME}/${TOMCAT_USERNAME}/g" ${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/pom.xml



cd ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui && \
sudo mvn package && /
sudo nohup mvn tomcat7:run-war &
