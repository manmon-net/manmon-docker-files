FROM manmon/tomcat9:latest

RUN useradd -N -m -u 10006 manmon-uploader \
 && mkdir -p /home/manmon-uploader/tomcat/webapps \ 
 && ln -s /home/manmon-tomcat/tomcat/bin /home/manmon-uploader/tomcat/bin \
 && ln -s /home/manmon-tomcat/tomcat/lib /home/manmon-uploader/tomcat/lib \
 && ln -s /home/manmon-tomcat/tomcat/conf /home/manmon-uploader/tomcat/conf \
 && mkdir -p /home/manmon-uploader/tomcat/temp /home/manmon-uploader/tomcat/work \
 && mkdir -p /home/manmon-uploader/tomcat/logs \
 && mkdir -p /home/manmon-tomcat/apache-tomcat-9.0.20/conf/Catalina && chown manmon-uploader /home/manmon-tomcat/apache-tomcat-9.0.20/conf/Catalina \
 && chown -R manmon-uploader /home/manmon-uploader/tomcat/temp /home/manmon-uploader/tomcat/work /home/manmon-uploader/tomcat/webapps /home/manmon-uploader/tomcat/logs \
 && rm -f /home/manmon-tomcat/tomcat/conf/server.xml \
 && ln -s /home/manmon-uploader/conf/server.xml /home/manmon-tomcat/tomcat/conf/server.xml 

EXPOSE 8943
EXPOSE 8080
USER manmon-uploader

ENV CATALINA_OPTS="-Xms512m -Xmx2048m"

CMD ["/home/manmon-uploader/tomcat/bin/catalina.sh","run"]


