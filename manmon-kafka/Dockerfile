FROM manmon/manmon-openjdk-8-jre

RUN useradd -m -u 100003 -N manmon_kafka
RUN wget -q -O /tmp/kafka.tar.gz http://www.nic.funet.fi/pub/mirrors/apache.org/kafka/2.2.0/kafka_2.12-2.2.0.tgz \
 && cd /home/manmon_kafka \ 
 && tar xzf /tmp/kafka.tar.gz \
 && ln -s /home/manmon_kafka/kafka_2.12-2.2.0 /home/manmon_kafka/kafka \
 && rm -f /tmp/kafka.tar.gz \
 && mkdir -p /home/manmon_kafka/data \
 && chown manmon_kafka /home/manmon_kafka/data

RUN mkdir -p /home/manmon_kafka/logs && chown manmon_kafka /home/manmon_kafka/logs && ln -s /home/manmon_kafka/logs /home/manmon_kafka/kafka/logs

ADD server.properties /home/manmon_kafka/kafka/config/server.properties

EXPOSE 9092

ADD manmon-java-agent-1.0.jar /opt/manmon-java-agent-1.0.jar

USER manmon_kafka
ENV KAFKA_OPTS="-javaagent:/opt/manmon-java-agent-1.0.jar"
CMD ["/home/manmon_kafka/kafka/bin/kafka-server-start.sh", "/home/manmon_kafka/kafka/config/server.properties"]

