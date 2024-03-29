source "$HOME/.aliases"

# ENV_VARIABLES
export GEM_EDITOR="vim"
export BUNDLER_EDITOR="vim"
export PATH=/usr/local/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules,vendor}/*"'
bind -x '"\C-p": vim $(fzf);'

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

eval "$(rbenv init - bash)"

export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="$PATH:/opt/yarn-[version]/bin"
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# pyenv
if command -v pyenv 1>/dev/null 2>&1
then eval "$(pyenv init -)"
fi
export PYENV_VERSION=2.7.14

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)"
