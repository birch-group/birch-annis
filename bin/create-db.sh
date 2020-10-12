#!/bin/bash
source ./bin/config.sh

echo ${allConfigs}
{
  psql -d postgres -c \
  "CREATE USER ${POSTGRES_USER}"
  psql -d postgres -c \
  "CREATE DATABASE ${DB_NAME} OWNER ${POSTGRES_USER} ENCODING 'UTF-8'"
  if [ $? -eq "1" ]; then
    echo "Postgres database ${DB_NAME} aready exists."
  else
    echo -e "${GREEN}Postgres database created${RESET}"
    echo
  fi
  ./bin/db-config.sh
} || {
  echo -e "${RED}Postgres not installed or configured incorrectly${RESET}"
  exit 1
}
