#!/bin/sh -e

for podfile in $(find ./src/ -name '*.pod'); do
  podchecker -nowarnings "${podfile}" || exit 1
done
