# zsh aliases
# -*- mode: zsh -*-
# Sources:
#   - https://github.com/tomnomnom/dotfiles
#   - https://tighten.co/blog/open-github-pull-request-from-terminal
#   - https://github.com/hashicorp/vagrant/issues/1011

function ip_info() {
    ip=$(curl -s curlmyip.net)
    echo -n "IP : $ip"
    which pbcopy >/dev/null
    if [ $? -eq 0 ]; then
        echo $ip | pbcopy
        echo " (copied)"
    else
        echo
    fi
}

function vagrant_status() {
    echo "Current machine states:"
    echo
    printf "%-30s%-15s\n" "VM" "State"
    for vmdir in .vagrant/machines/*; do
        vmname=`basename $vmdir`
        [ -f $vmdir/virtualbox/id ] && id=`cat $vmdir/virtualbox/id` || continue
        state=$(VBoxManage showvminfo --machinereadable $id | grep ^VMState= | cut -f2 -d '"')
        printf "%-30s%-30s\n" $vmname $state
    done
    echo
}

# Start a jump server session
function do_jump() {
    if [ ! -e ~/.jump-servers ]; then
        echo "**********"
        echo "Jump server list not found at ~/.jump-servers"
        echo "**********"
        exit 1
    fi
    servers=($(cat ~/.jump-servers))
    size=${#servers[@]}
    index=$(($RANDOM % $size))
    server=${servers[index]}
    echo "*********************"
    echo "JUMPING TO $server"
    echo "*********************"
    echo
    ssh $server
}

# Open a github PR
# function pr() {
#   github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/'`
#   branch_name=`git symbolic-ref HEAD | cut -d"/" -f 3,4`
#   pr_url=$github_url"/compare/master..."$branch_name
#   open $pr_url
# }

# Jump up a given number of directories
function cu {
    local count=$1
    if [ -z "${count}" ]; then
        count=1
    fi
    local path=""
    for i in $(seq 1 ${count}); do
        path="${path}../"
    done
    cd $path
}
