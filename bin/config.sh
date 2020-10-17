#!/usr/bin/env bash
source ./bin/secrets.sh

. ~/.bash_profile
# finding tomcat directory (regardless of version)
# TOMCAT_DIR=$(ls -d apache-tomcat*)

# finding annis service directory (regardless of version)
ANNIS_SERVICE_DIR=$(ls -d annis-service*)

# finding annis gui directory (regardless of version)
ANNIS_GUI_DIR=$(ls -d annis-gui*)

# values to replace in PG config
# per reccomendations made at http://korpling.github.io/ANNIS/3.6/user-guide/advanced-postgresql.html
shared_buffers="512MB"
work_mem="128MB"
maintenance_work_mem="256MB"
effective_cache_size="1536MB"
default_statistics_target="100"
checkpoint_segments="20"

allConfigs=(shared_buffers
            work_mem
            maintenance_work_mem
            effective_cache_size
            default_statistics_target
            checkpoint_segments)






# colored text: DON'T EDIT
RED=`tput setaf 1`
RESET=`tput sgr0`
GREEN=`tput setaf 2`
