# GIT SHORTCUTS
alias gco="git checkout"
alias gpl="git pull --rebase"
alias gps="git push"
alias gcm="git commit -a -m"
alias gst="git statuss"

alias subl="sublime"
alias ppr="powder restart && powder open"

# DIR SHORTCUTS
alias cdap="cd ~/Documents/ActiveProspect"
alias cdra="cd ~/Documents/Rails"
alias cdsd="cd ~/Documents/Rails/simpledonation"
alias cdsp="cd ~/Documents/Rails/simpledonation-prospects"
alias cdnotes="cd ~/Documents/Sync/notes"
alias cdblog="cd ~/Documents/Rails/taylorbrooksorg"
alias cdpow="cd ~/.pow"

alias be="bundle exec"
alias pca="RAILS_ENV=production be rake assets:precompile"
alias start_redis="cd /usr/local/Cellar/redis/2.2.12/bin && ./redis-server"
alias start_es="elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.17.5/config/elasticsearch.yml"


# ENV_VARIABLES
export GEM_EDITOR="sublime"
export BUNDLER_EDITOR="sublime"

export PATH=/usr/local/bin:$PATH

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
