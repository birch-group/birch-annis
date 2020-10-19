#!/bin/bash
source ./bin/config.sh

# Grab maven log from nohup.out
cat ./${ANNIS_GUI_DIR}/META-INF/maven/annis-gui/nohup.out
