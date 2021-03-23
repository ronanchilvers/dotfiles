# zsh aliases
# -*- mode: zsh -*-
# Sources:
#   - https://github.com/tomnomnom/dotfiles
#   - https://github.com/victoriadrake/dotfiles

# General
alias refresh="source ~/dotfiles/.zshrc && clear"
#alias myip="ip=$(curl -s curlmyip.net) ; echo \"IP : $ip\" ; echo $ip | pbcopy"
alias home="cd ~/ && clear"
alias :q="exit"
alias tailf="tail -f"

# Git
alias add="git add"
alias br="git branch"
alias ci="git commit"
alias co="git checkout"
alias changes="git diff"
alias cached="git diff --cached"
alias fetch="git fetch --prune"
alias gui="git gui"
alias log="git log"
alias merge="git merge"
alias pop="git stash pop"
alias pull="git pull --prune"
alias push="git push"
alias rem="git remote"
alias st="git status -sb"
alias stash="git stash"
alias unstage="git reset HEAD"

# Hub commands
alias pr="hub pull-request -c -o"
alias prs="hub pr list"
alias pro="hub pr show"

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
