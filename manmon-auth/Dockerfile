FROM manmon/tomcat9:latest

RUN useradd -N -m -u 10004 manmon-auth \
 && mkdir -p /home/manmon-auth/tomcat/webapps \ 
 && ln -s /home/manmon-tomcat/tomcat/bin /home/manmon-auth/tomcat/bin \
 && ln -s /home/manmon-tomcat/tomcat/lib /home/manmon-auth/tomcat/lib \
 && ln -s /home/manmon-tomcat/tomcat/conf /home/manmon-auth/tomcat/conf \
 && mkdir -p /home/manmon-auth/tomcat/temp /home/manmon-auth/tomcat/work \
 && mkdir -p /home/manmon-auth/tomcat/logs \
 && mkdir -p /home/manmon-tomcat/apache-tomcat-9.0.20/conf/Catalina && chown manmon-auth /home/manmon-tomcat/apache-tomcat-9.0.20/conf/Catalina \
 && chown -R manmon-auth /home/manmon-auth/tomcat/temp /home/manmon-auth/tomcat/work /home/manmon-auth/tomcat/webapps /home/manmon-auth/tomcat/logs 

ADD server.xml /home/manmon-auth/tomcat/conf
RUN chmod o+r /home/manmon-auth/tomcat/conf/server.xml

EXPOSE 8580
USER manmon-auth

ENV CATALINA_OPTS="-Xms512m -Xmx2048m"

CMD ["/home/manmon-auth/tomcat/bin/catalina.sh","run"]


