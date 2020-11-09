#!/bin/bash
source ./bin/config.sh

# Updates PG_CONFIG with values as specified in bin/config.sh
# If line in PG_CONFIG starts with '#', it is uncommented and filled with
# specified value.
if [ -z "$PG_CONFIG" ]; then
	echo -e "${RED}Make sure PG_CONFIG is set as an environment variable${RESET}"
	exit 2
fi

# replacing variables in pg config
sudo bash ./bin/sed-pg_config.sh

sudo systemctl restart postgresql-11
echo "Restarting Postgres..."
echo -e "${GREEN}Postgres config updated${RESET}"
echo
