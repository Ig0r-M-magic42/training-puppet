## Docker
### Windows
```bash
# fire up service, if it fails rebuild it
 docker-compose up -d
 
# To rebuild run below command
#docker-compose build && docker-compose down && docker-compose up -d

# start puppet server and enable it
docker-compose exec puppet.docker systemctl start puppetserver && \
docker-compose exec puppet.docker systemctl enable puppetserver

# If using docker-compose on widows to ssh use `docker-compose run centos7 //bin/bash` as explained in here https://stackoverflow.com/a/21907301/3904245.
docker-compose run puppet.docker //bin/bash

```
