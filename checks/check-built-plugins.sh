#!/bin/sh -e

echo "### Checking whether all known working plugins on this platform have been built ###"
STATUS=0
for i in ${SUPPORTED_PLUGIN_LIST}; do
  echo "$i plugin:"
  if test -f "src/$i.c"; then
    if test -f ."libs/${i}.so"; then
      ldd ".libs/${i}.so" || STATUS=1
    else
      ldd "src/.libs/${i}.so" || STATUS=1
    fi
  else
    echo "... doesn't exist in this version"
  fi
done

echo "### Looking for any plugins previously unsupported on this platform ###"
for i in .libs/*.so src/libs/*.so; do
  plugin="$(basename $i)"
  [ "${plugin}" = '*.so' ] && continue
  FOUND=0
  for j in ${SUPPORTED_PLUGIN_LIST}; do
    [ "x${plugin}" = "x${j}.so" ] && FOUND=1
  done
  if [ $FOUND -eq 0 ]; then
    echo "found this new plugin: ${plugin}"
    ldd "${i}"
  fi
done

exit $STATUS
