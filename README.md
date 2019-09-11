## Docker
### Windows
If using docker-compose on widows to ssh use `docker-compose run centos7 //bin/bash` as explained in here https://stackoverflow.com/a/21907301/3904245.
```bash
# fire up service
 docker-compose up -d
 
# ssh
docker-compose run centos7 //bin/bash

# Rebuild
docker-compose build && docker-compose down && docker-compose up -d
```

```bash
## Once Inside run

# Get puppet
rpm -Uvh http://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
# Install puppetserver, nano, man, htop
yum install -y puppetserver nano man htop

# Change min max mem to 512m for puppetserver
sed -i 's/2g/512m/g' /etc/sysconfig/puppetserver

## Exit
# start puppet server and enabling it
docker-compose exec testing-puppet systemctl start puppetserver
docker-compose exec testing-puppet systemctl enable puppetserver

```
