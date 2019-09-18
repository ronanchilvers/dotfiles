# bash aliases
# -*- mode: bash -*-
# Sources:
#   - https://github.com/tomnomnom/dotfiles
#   - https://github.com/victoriadrake/dotfiles

# General
alias refresh="source ~/dotfiles/.bashrc && clear"
#alias myip="ip=$(curl -s curlmyip.net) ; echo \"IP : $ip\" ; echo $ip | pbcopy"
alias home="cd ~/ && clear"
alias :q="exit"

# Git
alias add="git add"
alias br="git branch"
alias ci="git commit"
alias co="git checkout"
alias dif="git diff"
alias fetch="git fetch"
alias gui="git gui"
alias merge="git merge"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias rem="git remote"
alias st="git status -sb"
alias stash="git stash"
alias unstage="git rm --cached"

# Composer
alias c="composer"
alias serve="clear && composer serve"

# Vagrant
alias v="vagrant"
alias vhalt="vagrant halt"
alias vreup="vagrant reload"
alias vssh="vagrant ssh"
# alias vst="vagrant status"
alias vst="vagrant_status"
alias vup="vagrant up"

# Network
alias jump="do_jump"

# Stoker
alias up="stoker deployment:update"
