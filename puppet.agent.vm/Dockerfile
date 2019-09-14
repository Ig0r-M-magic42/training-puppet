FROM centos:7

RUN rpm -Uvh http://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

# Install anything. The service you want to start must be a SystemD service.
# Also apparently required to be executed to be able to talk with other containers without updating /etc/hosts
CMD ["/usr/sbin/init"]

# yum installs
RUN yum install nano man puppet -y

# Define master server in puppet config
RUN echo -e "[agent]\nserver = puppet.master.vm" >> /etc/puppetlabs/puppet/puppet.conf

# Adding puppet bin to the $PATH to use gem and apply new $PATH
ENV PATH="/opt/puppetlabs/puppet/bin:${PATH}"
