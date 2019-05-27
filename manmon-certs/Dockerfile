FROM manmon/tomcat9:latest

RUN useradd -N -m -u 10008 manmon-certs && \
  mkdir -p /home/manmon-certs/tmp && \
  chown 10008 /home/manmon-certs/tmp && \
  chmod 700 /home/manmon-certs/tmp 
ADD files/uploader-server.xml.original /home/manmon-certs/tmp 
ADD files/gen_keys.sh /home/manmon-certs/gen_keys.sh
USER manmon-certs
