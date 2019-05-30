FROM manmon/manmon-openjdk-8-jre

RUN apt-get update && apt-get install -y libapr1 libtcnative-1 wget && apt-get clean
RUN wget -q -O /tmp/tomcat.tar.gz http://www.nic.funet.fi/pub/mirrors/apache.org/tomcat/tomcat-9/v9.0.20/bin/apache-tomcat-9.0.20.tar.gz \
 && mkdir -p /home/manmon-tomcat \
 && cd /home/manmon-tomcat \
 && tar xzf /tmp/tomcat.tar.gz \
 && ln -s /home/manmon-tomcat/apache-tomcat-9.0.20 /home/manmon-tomcat/tomcat \
 && rm -f /tmp/tomcat.tar.gz \
 && rm -rf /home/manmon-tomcat/tomcat/webapps/* \
 && chmod o+rx /home/manmon-tomcat/tomcat/bin /home/manmon-tomcat/tomcat/conf /home/manmon-tomcat/tomcat/lib /home/manmon-tomcat/tomcat/bin/*.sh \
 && chmod -R o+r /home/manmon-tomcat/tomcat/bin /home/manmon-tomcat/tomcat/conf /home/manmon-tomcat/tomcat/lib 
 && chmod o+x /home/manmon-tomcat/tomcat/bin /home/manmon-tomcat/tomcat/conf /home/manmon-tomcat/tomcat/lib

RUN useradd -N -m -u 100006 manmon_uploader \
 && mkdir -p /home/manmon_uploader/tomcat/webapps \ 
 && ln -s /home/manmon-tomcat/tomcat/bin /home/manmon_uploader/tomcat/bin \
 && ln -s /home/manmon-tomcat/tomcat/lib /home/manmon_uploader/tomcat/lib \
 && ln -s /home/manmon-tomcat/tomcat/conf /home/manmon_uploader/tomcat/conf \
 && mkdir -p /home/manmon_uploader/tomcat/temp /home/manmon_uploader/tomcat/work \
 && mkdir -p /home/manmon_uploader/tomcat/logs \
 && mkdir -p /home/manmon-tomcat/apache-tomcat-9.0.20/conf/Catalina && chown manmon_uploader /home/manmon-tomcat/apache-tomcat-9.0.20/conf/Catalina \
 && chown -R manmon_uploader /home/manmon_uploader/tomcat/temp /home/manmon_uploader/tomcat/work /home/manmon_uploader/tomcat/webapps /home/manmon_uploader/tomcat/logs \
 && rm -f /home/manmon-tomcat/tomcat/conf/server.xml \
 && ln -s /home/manmon_uploader/conf/server.xml /home/manmon-tomcat/tomcat/conf/server.xml 

ADD manmon-java-agent-1.0.jar /opt/manmon-java-agent-1.0.jar
 
EXPOSE 8943
USER manmon_uploader

ENV CATALINA_OPTS="-Xms512m -Xmx2048m -javaagent:/opt/manmon-java-agent-1.0.jar"

CMD ["/home/manmon_uploader/tomcat/bin/catalina.sh","run"]


