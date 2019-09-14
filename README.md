## Docker
### Windows
> check notes section for first time setup as below commands use some of the aliases

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
docker-rebuild && docker-startPuppet && docker-ssh
```

#### Post Docker Setup
```bash
# Deploy r10k
r10k deploy environment -p

```

### Notes
* Update `~/.bash_profile` with below config to make life easier
```bash
# General docker commands
alias docker-stop='docker stop $(docker ps -a -q)'
alias docker-rebuild='docker-compose build && docker-compose down && docker-compose up -d'
## If using docker-compose on widows to ssh use `docker-compose run centos7 //bin/bash` as explained in here https://stackoverflow.com/a/21907301/3904245
alias docker-ssh='docker-compose run puppet.docker //bin/bash'
## Puppet related aliases
alias docker-puppetStart='docker-compose exec puppet.docker systemctl start puppetserver && docker-compose exec puppet.docker systemctl enable puppetserver'
alias docker-puppetStatus='docker-compose exec puppet.docker systemctl status puppetserver'
alias docker-puppetRebuild='docker-rebuild && docker-puppetStart'

```

