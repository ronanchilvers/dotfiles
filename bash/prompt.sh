# bash aliases
# -*- mode: bash -*-
# Sources:
#   - https://github.com/tomnomnom/dotfile

# 'Safe' version of __git_ps1 to avoid errors on systems that don't have it
function __my_git_ps1 {
  command -v __git_ps1 > /dev/null && __git_ps1 "(%s) "
}

# Colours have names too. Stolen from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# Prompt colours
atC="${txtwht}"
nameC="${bldgrn}"
hostC="${bldgrn}"
pathC="${bldblu}"
gitC="${bldylw}"
pointerC="${txtgrn}"
normalC="${txtwht}"

# Prompt definition
# export PS1="${nameC}\u${atC}@${hostC}\h:${pathC}\W${gitC}\$(__my_git_ps1)${pointerC}\$${normalC} "
#export PS1="${pathC}\W${gitC} \$(__my_git_ps1)${pointerC}\$${normalC} "
export PROMPT_COMMAND='__git_ps1 "${pathC}\W${txtrst}" "${pointerC} \$${normalC} "'
