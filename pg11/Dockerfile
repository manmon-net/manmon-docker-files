FROM ubuntu:18.04

RUN apt-get update && apt-get install -y gnupg2 wget && apt-get clean

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && apt-get install -y postgresql-11 && apt-get clean
RUN rm -rf /var/lib/postgresql/*

ARG userid
ARG username
RUN groupadd -g 100000 manmon_pg
RUN useradd -M -g 100000 -u ${userid} ${username} 
RUN mkdir -p /var/lib/postgresql/11 && chown ${username} /var/lib/postgresql/11
ADD run_pg.sh /var/lib/postgresql/
RUN chmod +x /var/lib/postgresql/run_pg.sh
RUN chgrp manmon_pg /var/run/postgresql/
RUN chmod 770 /var/run/postgresql/

EXPOSE 5432

USER ${username}
CMD ["/var/lib/postgresql/run_pg.sh"]

