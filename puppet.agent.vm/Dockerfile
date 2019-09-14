FROM centos:7

RUN rpm -Uvh http://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

# yum installs
RUN yum install yum-utils nano man htop puppet -y && \
    yum-config-manager --enable centosplus >& /dev/null && \
    yum clean all

# Adding following lines to puppet config @todo update
#RUN echo -e "\n[main]\ncertname = puppet.docker\nserver = puppet.docker\n[agent]\nserver = puppet.docker" >> /etc/puppetlabs/puppet/puppet.conf
#RUN echo -e "[agent]\nserver = puppet.docker" >> /etc/puppetlabs/puppet/puppet.conf

# Adding puppet bin to the $PATH to use gem and apply new $PATH
ENV PATH="/opt/puppetlabs/puppet/bin:${PATH}"
