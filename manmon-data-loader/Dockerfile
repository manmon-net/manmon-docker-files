FROM manmon/manmon-openjdk-8-jre

RUN useradd -N -m -u 100012 manmon_data_loader
USER manmon_data_loader

ADD manmon-java-agent-1.0.jar /opt/manmon-java-agent-1.0.jar 
ADD run-data-loader.sh /home/manmon_data_loader/run-data-loader.sh
CMD ["/home/manmon_data_loader/run-data-loader.sh"]
