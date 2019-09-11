## Docker
### Windows
If using docker-compose on widows to ssh use `docker-compose run centos7 //bin/bash` as explained in here https://stackoverflow.com/a/21907301/3904245.
```bash
#fire up service
 docker-compose up -d
 
# ssh
docker-compose run centos7 //bin/bash
```
#### Inside container to run following commands
```bash
# Commands to run
rpm -Uvh http://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
yum install -y puppetserver nano man htop

# Change min max mem to 512m
sed -i 's/2g/512m/g' /etc/sysconfig/puppetserver

```
