cd ../manmon-tomcat9
docker build --build-arg userid=100014 --build-arg app=mib --build-arg tomcat_port1=8205 --build-arg tomcat_port2=8280 -t manmon/manmon-mib .
