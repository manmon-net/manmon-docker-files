FROM centos:7
RUN yum -y install rpm-build && yum clean all
RUN useradd -M -N -u 100010 mmagent
RUN mkdir -p /home/mmagent/.tmp && chown mmagent /home/mmagent/.tmp && chmod 700 /home/mmagent/.tmp && mkdir -p /home/mmagent/rpmbuild && chown mmagent /home/mmagent/rpmbuild && chmod 700 /home/mmagent/rpmbuild
ADD create_pkg.sh /home/mmagent/create_pkg.sh
ADD generate_constants.py /home/mmagent/generate_constants.py
ADD manmon-conf.spec /home/mmagent/manmon-conf.spec
USER mmagent
