cd ../manmon-tomcat9
docker build --build-arg userid=100004 --build-arg app=auth --build-arg tomcat_port1=8505 --build-arg tomcat_port2=8580 -t manmon/manmon-auth .
