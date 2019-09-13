FROM centos:centos7

RUN rpm -Uvh http://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

RUN yum install yum-utils -y && \
    yum-config-manager --enable centosplus >& /dev/null && \
    yum clean all
