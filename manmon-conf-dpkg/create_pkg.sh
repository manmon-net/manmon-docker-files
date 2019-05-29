#!/bin/bash
if [ ! -f /usr/bin/python3 ]
then
  echo "Need python 3"
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
if [ -z "$RELEASE" ]
then
  echo "Need environment variable RELEASE"
  exit 1
fi
if [ -z "$UPLOADHOST" ]
then
  echo "Need environment variable UPLOADHOST"
  exit 1
fi

VER="${VER}-${RELEASE}"
cd /home/mmagent/.tmp
mkdir -p DEBIAN
cp -p ../control DEBIAN/control
perl -p -i -e "s/Package: manmon-conf/Package: manmon-conf-$CONFNAME/" DEBIAN/control
perl -p -i -e "s/Version: 1.0-1/Version: ${VER}/" DEBIAN/control
PKGNAME=manmon-conf-${CONFNAME}_${VER}.all
if [ -f /home/manmon-conf/${PKGNAME} ]
then
  echo "Package /home/manmon-conf/${PKGNAME} exists already"
  exit 0
fi
mkdir -p ${PKGNAME}
mv DEBIAN ${PKGNAME}/DEBIAN
cp -r var ${PKGNAME}/var
if [ ! -f /home/manmon-conf/.constants ]
then
  python3 /home/mmagent/generate_constants.py "$UPLOADHOST" 
  echo "Created constants"
fi
cp /home/manmon-conf/.constants ${PKGNAME}/var/lib/manmon/.constants
chmod 400 ${PKGNAME}/var/lib/manmon/.constants
dpkg -b ${PKGNAME} > /dev/null
mv ${PKGNAME}.deb /home/manmon-conf
rm -rf ${PKGNAME}
echo "Package /home/manmon-conf/${PKGNAME}  succesfully created"
