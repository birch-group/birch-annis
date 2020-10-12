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
for x in "${allConfigs[@]}"
do
  echo "Setting" $x "to "${!x}"..."
  sudo sed -i "s/\(^#\)\($x\)/\2/" $PG_CONFIG
  sudo sed -i "s/\(^$x *= *\).*/\1${!x}/" $PG_CONFIG
done

sudo systemctl restart postgresql-11
echo "Restarting Postgres..."
echo -e "${GREEN}Postgres config updated${RESET}"
echo
