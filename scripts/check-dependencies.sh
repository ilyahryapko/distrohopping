#!/bin/bash
MISSING_DEPS=()
for dep in $@
do
  command -v $dep >/dev/null 2>&1 || { echo -en "Missing dependency: $dep";deps=1;}
done
[[ $deps -ne 1 ]] && echo "Dependencies checked" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }
