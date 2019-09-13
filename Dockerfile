FROM centos:centos7

# Don't know if it's possible to run services without starting this
CMD /usr/sbin/init

RUN rpm -Uvh http://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

# yum installs
RUN yum install yum-utils nano man htop puppet puppetserver facter -y

# Change min max mem to 512m for puppetserver
RUN sed -i 's/2g/512m/g' /etc/sysconfig/puppetserver

# Adding following lines to puppet config
RUN echo -e "[agent]\nserver = puppet.docker" >> /etc/puppetlabs/puppet/puppet.conf
# Define hostname for network
RUN echo -e "NETWORKING=yes\nHOSTNAME=puppet.docker" >> /etc/sysconfig/network

# Follow post docker-up steps in main README.md
