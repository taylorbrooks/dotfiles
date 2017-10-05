source "$HOME/.aliases"

# ENV_VARIABLES
export GEM_EDITOR="vim"
export BUNDLER_EDITOR="vim"
export PATH=/usr/local/bin:$PATH
export STACK_HOME="/Users/taylorbrooks/Documents/source/stack"
source $STACK_HOME/bin/stack.env

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$PATH:/usr/local/Cellar/elixir/1.0.5"


# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

function precmd() {
  PROMPT="%n@%m %~$(parse_git_branch)%# "
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
\w$GREEN\$(parse_git_branch)$WHITE\
$GREEN\$ $WHITE"
PS2='> '
PS4='+ '
}
proml

eval "$(rbenv init -)"

wmssh () {
  instance_name=$1
  bastion="wellmatch-ssh@54.67.33.128"
  ip=`aws ec2 describe-instances --filters "Name=tag:Name,Values=$instance_name" "Name=instance-state-name,Values=running" --query "Reservations[0].Instances[0].NetworkInterfaces[0].PrivateIpAddresses[0].PrivateIpAddress" --output text --profile wellmatch`
  ssh -A -t $bastion ssh -A -t ubuntu@$ip
}
