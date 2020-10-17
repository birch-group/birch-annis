#!/bin/bash
source ./bin/config.sh


if [ -z "$TOMCAT_DIR" ]; then
	echo -e "${RED}Make sure TOMCAT_DIR is set as an environment variable${RESET}"
	exit 2
fi


if  [[ -n $(cd ${TOMCAT_DIR}/webapps && ls | grep 'ROOT') ]]; then
	echo Existing ROOT found, replacing it now...
	sudo rm -r ${TOMCAT_DIR}/webapps/ROOT
fi

# Move to tomcat/webapps directory on VM
sudo cp -r ./${ANNIS_GUI_DIR} ${TOMCAT_DIR}/webapps

# Rename to ROOT
sudo mv ${TOMCAT_DIR}/webapps/${ANNIS_GUI_DIR} ${TOMCAT_DIR}/webapps/ROOT

# Make directories needed for maven
sudo mkdir ${TOMCAT_DIR}/webapps/ROOT/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src
sudo mkdir ${TOMCAT_DIR}/webapps/ROOT/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main
sudo mkdir ${TOMCAT_DIR}/webapps/ROOT/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp

# Copy over WEB-INF
cp -avr ${TOMCAT_DIR}/webapps/ROOT/WEB-INF/ ${TOMCAT_DIR}/webapps/ROOT/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/

# Copt over VAADIN
cp -avr ${TOMCAT_DIR}/webapps/ROOT/VAADIN/ ${TOMCAT_DIR}/webapps/ROOT/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/
