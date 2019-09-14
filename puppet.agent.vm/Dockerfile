FROM centos:7

RUN rpm -Uvh http://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

# yum installs
RUN yum install yum-utils nano man htop puppet -y && \
    yum-config-manager --enable centosplus >& /dev/null && \
    yum clean all

# Define master server in puppet config
RUN echo -e "[agent]\nserver = puppet.master.vm" >> /etc/puppetlabs/puppet/puppet.conf

# Adding puppet bin to the $PATH to use gem and apply new $PATH
ENV PATH="/opt/puppetlabs/puppet/bin:${PATH}"
