#!/bin/bash
source ./bin/config.sh

echo Starting Tomcat...

cd ${TOMCAT_DIR}/webapps/ROOT/META-INF/maven/de.hu-berlin.german.korpling.annis/ROOT && \
sudo mvn package

cd ${TOMCAT_DIR}/webapps/ROOT/META-INF/maven/de.hu-berlin.german.korpling.annis/ROOT && \
sudo nohup mvn tomcat:run-war &
