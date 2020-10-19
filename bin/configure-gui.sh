#!/bin/bash
source ./bin/config.sh


# if [ -z "$TOMCAT_DIR" ]; then
# 	echo -e "${RED}Make sure TOMCAT_DIR is set as an environment variable${RESET}"
# 	exit 2
# fi


# if  [[ -n $(cd ${TOMCAT_DIR}/webapps && ls | grep 'ROOT') ]]; then
# 	echo Existing ROOT found, replacing it now...
# 	sudo rm -r ${TOMCAT_DIR}/webapps/ROOT
# fi

# # Move to tomcat/webapps directory on VM
# sudo cp -r ./${ANNIS_GUI_DIR} ${TOMCAT_DIR}/webapps
#

# Make directories needed for maven
sudo mkdir ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src
sudo mkdir ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main
sudo mkdir ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp

# Copy over WEB-INF
cp -avr  ./${ANNIS_GUI_DIR}/WEB-INF/  annis-gui-3.6.0/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/

# Copy over VAADIN
cp -avr  ./${ANNIS_GUI_DIR}/VAADIN/  annis-gui-3.6.0/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/

# Copy over THIRD-PARTY
cp -avr  ./${ANNIS_GUI_DIR}/THIRD-PARTY/  annis-gui-3.6.0/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/
