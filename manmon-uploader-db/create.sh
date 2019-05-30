cd ../pg10
docker build --build-arg userid=100007 --build-arg username=manmon_uploader_db -t manmon/manmon-uploader-db .
