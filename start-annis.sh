#!/bin/bash
source ./bin/config.sh

# First stop annis
sudo ./stop-annis.sh

# Get -n keyword arg
while getopts ":n:" opt; do
  case $opt in
    n) NEWCONFIG="$OPTARG"
    ;;
  esac
done

# Set default to false
NEWCONFIG=${NEWCONFIG:=false}

if $NEWCONFIG
  then
    echo -e "${GREEN}Setting PG_CONFIG...${RESET}"
    ./bin/db-config.sh & process_id=$!
    wait $process_id
    if [ $? -eq "1" ]
    then
      exit 1
    fi
    echo -e "${GREEN}Copying annis-gui...${RESET}"
    ./bin/configure-gui.sh

else
  # Reset PG_CONFIG file if config.sh file was updated in latest git pull
  if [[ -n $(git diff --name-only HEAD~1 HEAD | grep "^bin/config.sh") ]]; then
    echo -e "${GREEN}Change detected in config file. Updating ${PG_CONFIG}...${RESET}"
    ./bin/db-config.sh & process_id=$!
    wait $process_id
    if [ $? -eq "1" ]
    then
      exit 1
    fi
  fi

  # Convert annis-gui to .war and move to tomcat/webapps IF
  # no existing annis_gui directory exists in the tomcat/webapps directory
  # if  [[ -z $(cd webapps && ls | grep 'ROOT') ]]; then
  #   echo -e "${GREEN}No ROOT file detected in ${TOMCAT_DIR}/webapps. Copying annis-gui...${RESET}"
  #   ./bin/configure-gui.sh & process_id=$!
  #   wait $process_id
  #   if [ $? -eq "1" ]
  #   then
  #     exit 1
  #   fi

  # there's been change in the latest git pull
  if [[ -n $(git diff --name-only HEAD~1 HEAD | grep "^$ANNIS_GUI_DIR") ]]; then
    echo -e "${GREEN}Change detected in annis-gui with last git pull. Re-packaging annis-gui...${RESET}"
    ./bin/configure-gui.sh & process_id=$!
    wait $process_id
    if [ $? -eq "1" ]
    then
      exit 1
    fi
  fi
fi

# Start backend
./bin/start-annis-backend.sh

# Start frontend
./bin/start-annis-frontend.sh
