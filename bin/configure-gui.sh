#!/bin/bash
source ./bin/config.sh


# Make directories needed for maven
sudo mkdir ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src
sudo mkdir ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main
sudo mkdir ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp

# Copy over WEB-INF
cp -avr ./${ANNIS_GUI_DIR}/WEB-INF/ annis-gui-3.6.0/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/

# Copy over VAADIN
cp -avr ./${ANNIS_GUI_DIR}/VAADIN/ ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/

# Copy over THIRD-PARTY
cp -avr ./${ANNIS_GUI_DIR}/THIRD-PARTY/ ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/

# Making WEB-INF directory in packaged maven
mkdir ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/META-INF

# Copy over META-INF/context.xml
cp ./${ANNIS_GUI_DIR}/META-INF/context.xml ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/META-INF/

# Copy over META-INF/MANIFEST.MF
cp ./${ANNIS_GUI_DIR}/META-INF/context.xml/MANIFEST.MF ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/META-INF/
