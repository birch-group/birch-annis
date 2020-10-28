#!/bin/bash
source ./bin/config.sh


# Checking for valid PG_CONFIG values
# https://www.postgresql.org/docs/12/config-setting.html#CONFIG-SETTING-NAMES-VALUES
valid_pg_value='^[0-9]+([.][0-9]+)?((B|kB|MB|GB|TB)|(us|ms|s|min|h|d)?)$'
for x in "${allConfigs[@]}"
do
  if [[ "$x" != "autovacuum" ]]; then
      if echo "${!x}" | grep -Eq $valid_pg_value; then
      #if echo "${!x}" | grep -Eq $memory_re || echo "${!x}" | grep -Eq $time_re || echo "${!x}" | grep -Eq $float_re; then
        echo "${GREEN}${!x} is valid${RESET}"
      else
        echo -e "${RED}Invalid PG config value ${!x} for $x${RESET}" >&2; exit
    fi
  fi
done


# Checking that annis_service and annis_gui directories exist
if [[ -z $(echo $ANNIS_SERVICE_DIR) ]]; then
  echo -e "${RED}No annis-service directory could be found${RESET}" >&2; exit
fi

if [[ -z $(echo $ANNIS_GUI_DIR) ]]; then
  echo -e "${RED}No annis-service directory could be found${RESET}" >&2; exit
fi
