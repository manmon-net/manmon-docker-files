cd ../pg10
docker build --build-arg userid=100016 --build-arg username=manmon_hosts_db -t manmon/manmon-hosts-db .
