#!/bin/bash
source ./bin/config.sh


if [ -z "$TOMCAT_DIR" ]; then
	echo -e "${RED}Make sure TOMCAT_DIR is set as an environment variable${RESET}"
	exit 2
fi

# Move to tomcat/webapps directory on VM
sudo cp -r ./${ANNIS_GUI_DIR} ${TOMCAT_DIR}/webapps

if  [[ -n $(cd ${TOMCAT_DIR}/webapps && ls | grep 'ROOT') ]]; then
	echo Existing ROOT found, replacing it now...
	sudo rm -r ${TOMCAT_DIR}/webapps/ROOT
fi

sudo mv ${TOMCAT_DIR}/webapps/${ANNIS_GUI_DIR} ${TOMCAT_DIR}/webapps/ROOT
