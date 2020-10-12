#!/bin/bash
source ./bin/config.sh

# Java 8 JDK is needed for Annis to work
export ANNIS_HOME=${ANNIS_SERVICE_DIR}
export PATH=$PATH:$ANNIS_HOME/bin


# annis-admin.sh init -u ${POSTGRES_USER} -d ${DB_NAME} -p ${POSTGRES_PASSWORD}

# Check if a previous annis run was left lingering
if [[ -n $(ps -ef | egrep '\-Dannis\.home\=annis\-service') ]]; then
  echo Previous ANNIS pid left lingering, killing it now...
  annis_pid=$(ps -ef | egrep '\-Dannis\.home\=annis\-service' | awk '{print $2}')
  sudo kill -9 ${annis_pid}
fi

annis-service.sh start
