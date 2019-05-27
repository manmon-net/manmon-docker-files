FROM ubuntu:18.04

RUN apt-get update && apt-get install -y openjdk-8-jre-headless wget && apt-get clean
RUN useradd -m -u 10003 -N manmon_kafka
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

USER manmon_kafka
CMD ["/home/manmon_kafka/kafka/bin/kafka-server-start.sh", "/home/manmon_kafka/kafka/config/server.properties"]

