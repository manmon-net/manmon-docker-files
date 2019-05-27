#!/bin/bash

if [ -z $MMPGUSER ]
then
  exit 1
fi
if [ -z $MMPGPWD ]
then
  exit 1
fi

if [ ! -d /var/lib/postgresql/10/main ]
then
  /usr/lib/postgresql/10/bin/initdb /var/lib/postgresql/10/main
  perl -p -i -e 's/ssl = on/ssl = off/' /var/lib/postgresql/10/main/postgresql.conf
  echo "host all  all    0.0.0.0/0  md5" > /var/lib/postgresql/10/main/pg_hba.conf
  echo "local all all ident" >> /var/lib/postgresql/10/main/pg_hba.conf
  echo "listen_addresses='*'" >> /var/lib/postgresql/10/main/postgresql.conf
  /usr/lib/postgresql/10/bin/postgres -D /var/lib/postgresql/10/main -c config_file=/var/lib/postgresql/10/main/postgresql.conf &
  PGPID=$!
  psql --command "CREATE USER ${MMPGUSER} WITH ENCRYPTED PASSWORD '${MMPGPWD}'" postgres
  createdb -O $MMPGUSER $MMPGUSER
  kill $PGPID
  sleep 5
fi
/usr/lib/postgresql/10/bin/postgres -D /var/lib/postgresql/10/main -c config_file=/var/lib/postgresql/10/main/postgresql.conf

