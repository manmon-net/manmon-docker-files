FROM manmon/manmon-openjdk-8-jre

ARG userid
ARG app
ARG tomcat_port1
ARG tomcat_port2

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

RUN useradd -N -m -u ${userid} manmon_${app} \
 && mkdir -p /home/manmon_${app}/tomcat/webapps \ 
 && ln -s /home/manmon-tomcat/tomcat/bin /home/manmon_${app}/tomcat/bin \
 && ln -s /home/manmon-tomcat/tomcat/lib /home/manmon_${app}/tomcat/lib \
 && ln -s /home/manmon-tomcat/tomcat/conf /home/manmon_${app}/tomcat/conf \
 && mkdir -p /home/manmon_${app}/tomcat/temp /home/manmon_${app}/tomcat/work \
 && mkdir -p /home/manmon_${app}/tomcat/logs \
 && mkdir -p /home/manmon-tomcat/apache-tomcat-9.0.20/conf/Catalina && chown manmon_${app} /home/manmon-tomcat/apache-tomcat-9.0.20/conf/Catalina \
 && chown -R manmon_${app} /home/manmon_${app}/tomcat/temp /home/manmon_${app}/tomcat/work /home/manmon_${app}/tomcat/webapps /home/manmon_${app}/tomcat/logs 

ADD server.xml /home/manmon_${app}/tomcat/conf/tmpserver.xml
RUN cat /home/manmon_${app}/tomcat/conf/tmpserver.xml | sed "s/8905/${tomcat_port1}/" | sed "s/8980/${tomcat_port2}/" > /home/manmon_${app}/tomcat/conf/server.xml
RUN rm -f /home/manmon_${app}/tomcat/conf/tmpserver.xml
RUN chmod o+r /home/manmon_${app}/tomcat/conf/server.xml
RUN ln -s /home/manmon_${app}/tomcat/bin/catalina.sh /usr/bin/catalina
ADD manmon-java-agent-1.0.jar /opt/manmon-java-agent-1.0.jar
EXPOSE ${tomcat_port2}
USER manmon_${app}

ENV JAVA_OPTS="-Xms512m -Xmx2048m"
ENV CATALINA_OPTS="-Xms512m -Xmx2048m -javaagent:/opt/manmon-java-agent-1.0.jar"

CMD ["/usr/bin/catalina","run"]


