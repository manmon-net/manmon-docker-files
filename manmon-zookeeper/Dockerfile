FROM manmon/manmon-openjdk-8-jre

RUN useradd -m -u 100002 -N manmon_zk
RUN wget -q -O /tmp/zookeeper.tar.gz http://www.nic.funet.fi/pub/mirrors/apache.org/zookeeper/stable/apache-zookeeper-3.5.5-bin.tar.gz \
 && cd /home/manmon_zk \ 
 && tar xzf /tmp/zookeeper.tar.gz \ 
 && ln -s /home/manmon_zk/apache-zookeeper-3.5.5-bin /home/manmon_zk/zookeeper \
 && rm -f /tmp/zookeeper.tar.gz \
 && mkdir -p /home/manmon_zk/data \
 && chown manmon_zk /home/manmon_zk/data
RUN mkdir /home/manmon_zk/zookeeper/logs && chown manmon_zk /home/manmon_zk/zookeeper/logs

ADD zoo.cfg /home/manmon_zk/zookeeper/conf/zoo.cfg

EXPOSE 2181 2888 3888

USER manmon_zk
CMD ["/home/manmon_zk/zookeeper/bin/zkServer.sh","start-foreground"]

