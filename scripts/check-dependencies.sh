#!/bin/bash
for dep in $@
do
  command -v $dep >/dev/null 2>&1 || {
    deps=1;
    echo $dep;
}
done
[[ $deps -ne 1 ]] && { exit 0; } || { exit 1; }
