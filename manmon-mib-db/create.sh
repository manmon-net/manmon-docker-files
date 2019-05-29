cd ../pg10
docker build --build-arg userid=10013 --build-arg username=manmon_mib_db -t manmon/manmon-mib-db .
