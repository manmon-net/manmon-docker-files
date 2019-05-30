FROM manmon/manmon-openjdk-8-jre
RUN apt-get update && apt-get -y install python3 && apt-get clean
RUN useradd -N -m -u 100008 manmon_certs && \
  mkdir -p /home/manmon_certs/tmp && \
  chown 100008 /home/manmon_certs/tmp && \
  chmod 700 /home/manmon_certs/tmp 
ADD files/uploader-server.xml.original /home/manmon_certs/tmp 
ADD files/gen_keys.sh /home/manmon_certs/gen_keys.sh
ADD files/gen_cert_constants.py /home/manmon_certs/gen_cert_constants.py
USER manmon_certs
