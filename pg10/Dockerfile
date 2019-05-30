FROM ubuntu:18.04
RUN apt-get update && apt-get install -y postgresql-10 && apt-get clean

ARG userid
ARG username
RUN groupadd -g 100000 manmon_pg
RUN useradd -M -g 100000 -u ${userid} ${username} 
RUN mkdir -p /var/lib/postgresql/10 && chown ${username} /var/lib/postgresql/10
ADD run_pg.sh /var/lib/postgresql/
RUN chmod +x /var/lib/postgresql/run_pg.sh
RUN chgrp manmon_pg /var/run/postgresql/
RUN chmod 770 /var/run/postgresql/

EXPOSE 5432

USER ${username}
CMD ["/var/lib/postgresql/run_pg.sh"]
