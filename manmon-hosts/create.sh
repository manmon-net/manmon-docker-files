cd ../manmon-tomcat9
docker build --build-arg userid=100017 --build-arg app=hosts --build-arg tomcat_port1=8105 --build-arg tomcat_port2=8180 -t manmon/manmon-hosts .
