cd ../pg10
docker build --build-arg userid=100005 --build-arg username=manmon_auth_db -t manmon/manmon-auth-db .
