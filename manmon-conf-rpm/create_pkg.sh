#!/bin/bash
if [ ! -f /usr/bin/python ]
then
  echo "Need python"
  exit 1
fi
if [ -z "$CONFNAME" ]
then
  echo "Need environment variable CONFNAME"
  exit 1
fi
if [ -z "$VER" ]
then
  echo "Need environment variable VER"
  exit 1
fi
if [ -z "$UPLOADHOST" ]
then
  echo "Need environment variable UPLOADHOST"
  exit 1
fi
if [ -z "$RELEASE" ]
then
  echo "Need environment variable RELEASE"
  exit 1
fi

if [ -f /home/manmon-conf/manmon-conf-${CONFNAME}-${VER}-${RELEASE}.noarch.rpm ]
then
  echo "Package with same name manmon-conf-${CONFNAME}-${VER}-${RELEASE}.noarch.rpm exists" 
  exit 0
fi
cd /home/mmagent/.tmp
mkdir -p /home/mmagent/rpmbuild/SOURCES
if [ ! -f /home/manmon-conf/.constants ]
then
  python /home/mmagent/generate_constants.py "$UPLOADHOST" 
  echo "Created constants"
fi
rm -f /home/mmagent/rpmbuild/SOURCES/.constants
cp -p /home/manmon-conf/.constants /home/mmagent/rpmbuild/SOURCES/
rpmbuild --define "name manmon-conf-${CONFNAME}" --define "version ${VER}" --define "release ${RELEASE}" -ba /home/mmagent/manmon-conf.spec >/dev/null 2>/dev/null
if [ "$?" -ne 0 ]
then 
  echo "Error building RPM package"
  exit 1
else
  cp -p /home/mmagent/rpmbuild/RPMS/noarch/manmon-conf*.rpm /home/manmon-conf/
  echo "Package build succeeded - /home/manmon-conf/manmon-conf-${CONFNAME}-${VER}-${RELEASE}.noarch.rpm"
fi

