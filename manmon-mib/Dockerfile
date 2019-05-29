FROM manmon/tomcat9:latest

RUN useradd -N -m -u 10014 manmon-mib \
 && mkdir -p /home/manmon-mib/tomcat/webapps \ 
 && ln -s /home/manmon-tomcat/tomcat/bin /home/manmon-mib/tomcat/bin \
 && ln -s /home/manmon-tomcat/tomcat/lib /home/manmon-mib/tomcat/lib \
 && ln -s /home/manmon-tomcat/tomcat/conf /home/manmon-mib/tomcat/conf \
 && mkdir -p /home/manmon-mib/tomcat/temp /home/manmon-mib/tomcat/work \
 && mkdir -p /home/manmon-mib/tomcat/logs \
 && mkdir -p /home/manmon-tomcat/apache-tomcat-9.0.20/conf/Catalina && chown manmon-mib /home/manmon-tomcat/apache-tomcat-9.0.20/conf/Catalina \
 && chown -R manmon-mib /home/manmon-mib/tomcat/temp /home/manmon-mib/tomcat/work /home/manmon-mib/tomcat/webapps /home/manmon-mib/tomcat/logs 

ADD server.xml /home/manmon-mib/tomcat/conf
RUN chmod o+r /home/manmon-mib/tomcat/conf/server.xml

EXPOSE 8280
USER manmon-mib

ENV CATALINA_OPTS="-Xms512m -Xmx2048m"

CMD ["/home/manmon-mib/tomcat/bin/catalina.sh","run"]


