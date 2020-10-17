#!/bin/bash
source ./bin/config.sh

# Grab maven log from nohup.out
echo ${TOMCAT_DIR}/webapps/ROOT/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/nohup.out
