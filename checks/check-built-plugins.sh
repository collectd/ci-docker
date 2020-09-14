#!/bin/bash

set -e

declare -A want
for p in ${SUPPORTED_PLUGIN_LIST}; do
  want["${p}"]=1
done

declare -A got
for f in .libs/*.so; do
  p="$(basename "${f}" .so)"

  if [[ -v want["${p}"] ]]; then
    unset want["${p}"]
    continue
  fi

  got["${p}"]=1
done

if [[ ${#got[@]} > 0 ]]; then
  echo "## The following EXTRA plugins were built:"
  echo ""
  for p in "${!got[@]}"; do
    echo " *  ${p}"
  done | sort
  echo ""
fi

if [[ ${#want[@]} > 0 ]]; then
  echo "## The following expected plugins are MISSING:"
  echo ""
  for p in "${!want[@]}"; do
    echo " *  ${p}"
  done | sort
  exit 1
fi
