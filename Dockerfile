# Check https://hub.docker.com/_/centos/#systemd-integration for help on how to run systemctl commands
# More info on setting up systemctl to work from https://forums.docker.com/t/any-simple-and-safe-way-to-start-services-on-centos7-systemd/5695/8
FROM centos:centos7

## Begin magical stuff to run services from Dockerfile
ENV container docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# named (dns server) service
RUN yum install -y bind bind-utils
RUN systemctl enable named.service

# Without this, init won't start the enabled services and exec'ing and starting
# them reports "Failed to get D-Bus connection: Operation not permitted".
VOLUME /run /run/lock /tmp

# Don't know if it's possible to run services without starting this
CMD /usr/sbin/init
## END magical stuff to run service from Dockerfile

RUN rpm -Uvh http://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

# yum installs
RUN yum install yum-utils nano man htop puppet puppetserver facter -y

# Change min max mem to 512m for puppetserver
RUN sed -i 's/2g/512m/g' /etc/sysconfig/puppetserver

# Start puppet server still does not work
#RUN systemctl start puppetserver
#RUN systemctl enable puppetserver

# Adding following lines to puppet config
RUN echo -e "[agent]\nserver = puppet.docker" >> /etc/puppetlabs/puppet/puppet.conf
# Define hostname for network
RUN echo -e "NETWORKING=yes\nHOSTNAME=puppet.docker" >> /etc/sysconfig/network
