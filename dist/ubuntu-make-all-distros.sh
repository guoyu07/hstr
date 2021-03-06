#!/bin/bash

# Launchpad release checklist:
# - update version in source code (hstr.c)
# - update version in configure.ac
# - update release message in this file
# - update version in this file
# - check target Ubuntu distributions in this file
# - check minor version in this file
# - run this script from ~/p/hstr/launchpad

if [ -e "../.git" ]
then
  echo "This script MUST NOT be run from Git repository - run it e.g. from ~/p/hstr/launchpad instead"
  exit 1
fi

export HHBZRMSG="Top and bottom prompt."
export VERSION=1.24.
export MINOR=0

# precise quantal saucy precise utopic vivid wily yakkety / trusty xenial zesty artful
for DISTRO in trustry xenial zesty artful
do

./ubuntu-make-distro.sh ${DISTRO} ${VERSION}${MINOR} "${HHBZRMSG}"
MINOR=`expr $MINOR + 1`

done

# eof
