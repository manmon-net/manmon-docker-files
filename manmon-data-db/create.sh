cd ../pg11
docker build --build-arg username=manmon_data_db --build-arg userid=100011 -t manmon/manmon-data-db .
