FROM centos:centos7

RUN rpm -Uvh http://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

# yum installs
RUN yum install yum-utils nano htop man puppet puppetserver facer -y && \
    yum-config-manager --enable centosplus >& /dev/null && \
    yum clean all
