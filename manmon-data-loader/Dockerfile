FROM manmon/manmon-openjdk-8-jre

RUN useradd -N -m -u 100012 manmon_data_loader
USER manmon_data_loader

ADD run-data-loader.sh /home/manmon_data_loader/run-data-loader.sh
CMD ["/home/manmon_data_loader/run-data-loader.sh"]
