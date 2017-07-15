## Colorize the ls command output and define ll alias
alias ls='ls --color=auto'
alias ll='ls -l'
alias lrt='ls -lrt'

## Colorize the diff command output (colordiff package needed)
alias diff='colordiff'

## Shortcut for tail -f
alias tailf='tail -f'

## Setting JAVA_HOME
JAVA_HOME=/usr/lib/jvm/default
export JAVA_HOME

## Add anaconda2 to PATH
export PATH="${PATH}:/opt/anaconda2/bin"

## Password generator
function genpasswd() {
  local l=$1
  if [[ "$l" == "" ]]; then
   l=40
  fi
  tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
