cd ../manmon-tomcat9
docker build --build-arg userid=100018 --build-arg app=web --build-arg tomcat_port1=9005 --build-arg tomcat_port2=9080 -t manmon/manmon-web .
