#!/bin/bash
source ./bin/config.sh

# Grab maven log from nohup.out
tail -100 ./${ANNIS_GUI_DIR}/META-INF/maven/de.hu-berlin.german.korpling.annis/annis-gui/nohup.out
