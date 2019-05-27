if [ -z "$1" ]
then
  echo "Give upload server hostname as parameter"
  exit 1
fi
if ! id -u manmon_zk > /dev/null 2>&1; then
  useradd -M -N -u 10002 manmon_zk
fi
if ! id -u manmon_kafka > /dev/null 2>&1; then
  useradd -M -N -u 10003 manmon_kafka
fi
if ! id -u manmon_auth > /dev/null 2>&1; then
  useradd -M -N -u 10004 manmon_auth
fi
if ! id -u manmon_auth_db > /dev/null 2>&1; then
  useradd -M -N -u 10005 manmon_auth_db
fi
if ! id -u manmon_uploader > /dev/null 2>&1; then
  useradd -M -N -u 10006 manmon_uploader
fi
if ! id -u manmon_uploader_db > /dev/null 2>&1; then
  useradd -M -N -u 10007 manmon_uploader_db
fi
if ! id -u manmon_certs > /dev/null 2>&1; then
  useradd -M -N -u 10008 manmon_certs
fi
if ! id -u mmagent > /dev/null 2>&1; then
  useradd -M -N -u 10010 mmagent
fi

if [ ! -d /home/manmon-certs/.certs ]
  docker run --rm -v /home/manmon-data/manmon-certs/.certs/:/home/manmon-certs/.certs/ -v /home/manmon-data/manmon-certs/conf:/home/manmon-certs/conf --name manmon-certs-tmp -it manmon/manmon-certs:latest /home/manmon-certs/gen_keys.sh
fi

