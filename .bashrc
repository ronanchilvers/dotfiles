# Path overrides
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.phpenv/bin:$PATH
export PATH=/usr/local/opt/bison@3.3/bin:$PATH

# Environment variables
export TZ="Europe/London"
export PHPDOC_AUTHOR="Ronan Chilvers <ronan@d3r.com>"

# Configure gpg agent
if [ ! -S ~/.gnupg/S.gpg-agent ]; then
    eval $( gpg-agent --daemon --default-cache-ttl 1800 )
fi

# Configure phpenv shims
eval "$(phpenv init -)"

# Aliases
source ~/dotfiles/.bash.aliases

# Prompt
source ~/dotfiles/.git-prompt.sh
source ~/dotfiles/.bash.prompt
