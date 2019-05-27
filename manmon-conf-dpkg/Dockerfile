FROM ubuntu:18.04

RUN apt-get update && apt-get -y install python3 && apt-get clean

RUN useradd -M -N -u 10010 mmagent
RUN mkdir -p /home/mmagent/.tmp && chown mmagent /home/mmagent/.tmp && chmod 700 /home/mmagent/.tmp
ADD control /home/mmagent/control
ADD create_pkg.sh /home/mmagent/create_pkg.sh
ADD generate_constants.py /home/mmagent/generate_constants.py
USER mmagent
