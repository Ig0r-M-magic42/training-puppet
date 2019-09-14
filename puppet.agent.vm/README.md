## Docker
> First time? Read #first-time
### Windows
#### General commands
```bash
# Rebuild service
 docker-rebuild
# OR UP it
# docker-compose -up -d

# SSH
docker-ssh

# All in one
docker-puppetRebuild && docker-ssh
```

# First Time
```bash
# Define puppet network
docker network create puppet

```

> Update `~/.bash_profile` with below config to make life easier
 ```bash
 # General docker commands
 alias docker-stop='docker stop $(docker ps -a -q)'
 alias docker-rebuild='docker-compose build && docker-compose down && docker-compose up -d'
 ## If using docker-compose on widows to ssh use `docker-compose run centos7 //bin/bash` as explained in here https://stackoverflow.c
 om/a/21907301/3904245
 docker--ssh () {
     echo ts docker-compose run $1 //bin/bash
 }
 
 ```