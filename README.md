## Docker
### Windows
If using docker-compose on widows to ssh use `docker-compose run centos7 //bin/bash` as explained in here https://stackoverflow.com/a/21907301/3904245.
```bash
# fire up service, if it fails rebuild it
 docker-compose up -d
 
# To rebuild run below command
#docker-compose build && docker-compose down && docker-compose up -d

# start puppet server and enable it
docker-compose exec testing-puppet systemctl start puppetserver
docker-compose exec testing-puppet systemctl enable puppetserver

# ssh
docker-compose run testing-puppet //bin/bash

```
