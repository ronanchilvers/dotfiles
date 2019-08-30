# bash aliases
# -*- mode: bash -*-
# Sources:
#   - https://github.com/tomnomnom/dotfiles
#   - https://github.com/victoriadrake/dotfiles

# General
alias refresh="source ~/dotfiles/.bashrc"
alias myip="ip=$(curl -s curlmyip.net) ; echo \"IP : $ip\" ; echo $ip | pbcopy"
alias home="cd ~/ && clear"
alias :q="exit"

# Git
alias add="git add"
alias ci="git commit"
alias co="git checkout"
alias fetch="git fetch"
alias merge="git merge"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias st="git status"
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
