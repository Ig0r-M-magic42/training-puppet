CPUS="2"
MEMORY="2048"

Vagrant.configure("2") do |config|

  config.vm.box = "bento/centos-7.6"
  config.vm.hostname = "master.puppet.vm"
  config.vm.network "private_network", ip: "172.30.1.5"

  config.vm.synced_folder "r10k/", "/etc/puppetlabs/r10k"
  config.vm.synced_folder "./", "/etc/puppetlabs/code/environments/production"

  config.vm.provider "virtualbox" do |v|
    v.name = "master.puppet.vm"
    v.memory = MEMORY
    v.cpus = CPUS
  end

  config.vm.provision "shell", inline: "
    # Adding puppet package repo
    rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

    yum install puppetserver git nano -y

    # Change min max mem to 512m for puppetserver
    sed -i 's/2g/512m/g' /etc/sysconfig/puppetserver

    # Start and enable puppetserver service
    systemctl start puppetserver
    systemctl enable puppetserver

    # Define master server in puppet config
    echo -e \"\n[agent]\nserver = master.puppet.vm\" >> /etc/puppetlabs/puppet/puppet.conf

    # Update .bash_profile PATH variable manually, run command and copy from below
#    nano ~/.bash_profile && source ~/.bash_profile

#    PATH=$PATH:/opt/puppetlabs/puppet/bin:$HOME/bin

    # Then install r10k
#    gem install r10k

  "
end
