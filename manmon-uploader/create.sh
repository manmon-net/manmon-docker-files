#docker build --build-arg userid=100006 --build-arg app=uploader --build-arg tomcat_port1=8945 --build-arg tomcat_port2=8943 -t manmon/manmon-uploder .
docker build -t manmon/manmon-uploader .
