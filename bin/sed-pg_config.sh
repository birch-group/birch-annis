#!/bin/bash
source ./bin/config.sh

# replacing variables in pg config
for x in "${allConfigs[@]}"
do
  echo "Setting" $x "to "${!x}"..."
  sudo sed -i "s/\(^#\)\($x\)/\2/" $PG_CONFIG
  sudo sed -i "s/\(^$x *= *\).*/\1${!x}/" $PG_CONFIG
done
