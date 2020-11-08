#!/bin/bash
source ./bin/config.sh

# Remove any previous src/ or target/ directories
rm -r ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/target
rm -r ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src

# Make directories needed for maven
mkdir ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src
mkdir ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main
mkdir ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp

# Copy over WEB-INF
cp -avr ./${ANNIS_GUI_DIR}/WEB-INF/ ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/

# Copy over VAADIN
cp -avr ./${ANNIS_GUI_DIR}/VAADIN/ ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/

# Copy over THIRD-PARTY
cp -avr ./${ANNIS_GUI_DIR}/THIRD-PARTY/ ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/

# # Making WEB-INF directory in packaged maven
# mkdir ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/META-INF
#
# # Copy over META-INF/context.xml
# cp ./${ANNIS_GUI_DIR}/META-INF/context.xml ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/META-INF/
#
# # Copy over META-INF/MANIFEST.MF
# cp ./${ANNIS_GUI_DIR}/META-INF/MANIFEST.MF ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/src/main/webapp/META-INF/
