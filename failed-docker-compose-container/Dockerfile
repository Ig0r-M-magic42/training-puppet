FROM centos:centos7

ENV container=docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

## named (dns server) service, REQUIRED to run systemctl start
RUN yum install -y bind bind-utils
RUN systemctl enable named.service

# Without this, init won't start the enabled services and exec'ing and starting
# them reports "Failed to get D-Bus connection: Operation not permitted".
VOLUME /run /tmp

# Don't know if it's possible to run services without starting this
CMD /usr/sbin/init

# Get puppet
RUN rpm -Uvh http://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
# Install puppetserver, nano, man, htop
RUN yum install -y puppetserver nano man htop

# Change min max mem to 512m for puppetserver
RUN sed -i 's/2g/512m/g' /etc/sysconfig/puppetserver

# Start puppet server (not tested yed)
ENTRYPOINT systemctl start puppetserver
ENTRYPOINT systemctl enable puppetserver

# Adding following lines to puppet config
ENTRYPOINT echo -e "[agent]\nserver = masterpuppetvm_default" >> /etc/puppetlabs/puppet/puppet.conf
# @todo create url master.puppet.vm
# Carry on after this from 4:40 From https://www.udemy.com/course/fundamentals-of-puppet/learn/lecture/9158106#overview