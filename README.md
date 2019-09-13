## Docker
### Windows
> check notes section for first time setup as below commands use some of the aliases

```bash
# Rebuild service
 docker-rebuild
# SSH
docker-ssh

```

### Notes
* Update `~/.bash_profile` with below config to make life easier
```bash
# General docker commands
alias docker-stop='docker stop $(docker ps -a -q)'
alias docker-rebuild='docker-compose build && docker-compose down && docker-compose up -d'
## If using docker-compose on widows to ssh use `docker-compose run centos7 //bin/bash` as explained in here https://stackoverflow.com/a/21907301/3904245
alias docker-ssh='docker-compose run puppet.docker //bin/bash'

```
