FROM manmon/manmon-openjdk-8-jre

RUN useradd -N -m -u 10012 manmon-data-loader
USER manmon-data-loader

ADD run-data-loader.sh /home/manmon-data-loader/run-data-loader.sh
CMD ["/home/manmon-data-loader/run-data-loader.sh"]
