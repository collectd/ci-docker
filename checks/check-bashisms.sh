#!/bin/sh -e

for shellscript in *.sh; do
  echo "running checkbashisms on ${shellscript}"
  checkbashisms -n "${shellscript}" || exit 1
done
