cd ../manmon-tomcat9
docker build --build-arg userid=100015 --build-arg app=data --build-arg tomcat_port1=8905 --build-arg tomcat_port2=8980 -t manmon/manmon-data .
