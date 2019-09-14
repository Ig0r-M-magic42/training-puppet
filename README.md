## Docker
### Windows
> First time? check #first-time

#### General commands
```bash
# Rebuild service
 docker-rebuild
# OR UP it
# docker-compose -up -d

 # After this run below commands to enable puppet as systemctl has problems to be run inside container
docker-startPuppet
# SSH
docker-ssh

# All in one
docker-puppetRebuild && docker-ssh
```

#### Post Docker Setup
```bash
# Deploy r10k in Master container
r10k deploy environment -p

```

# First Time
> Update `~/.bash_profile` with below config to make life easier
```bash
# General docker commands
alias docker-stop='docker stop $(docker ps -a -q)'
alias docker-rebuild='docker-compose build && docker-compose down && docker-compose up -d'
## If using docker-compose on widows to ssh use `docker-compose run centos7 //bin/bash` as explained in here https://stackoverflow.c
alias docker-sshPuppetMaster='docker-compose run puppetmaster //bin/bash'
alias docker-sshPuppetAgent='docker-compose run puppetagent //bin/bash'

alias docker-puppetStart='docker-compose exec puppetmaster systemctl start puppetserver && docker-compose exec puppetmaster systemctl enable puppetserver'
```
