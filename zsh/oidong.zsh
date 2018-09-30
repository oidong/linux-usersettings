## Colorize the ls command output and define ll alias
alias ls='ls --color=auto'
alias ll='ls -l'
alias lrt='ls -lrt'

## Colorize the diff command output (colordiff package needed)
alias diff='colordiff'

## Colorize aurman 
alias aurman='aurman --color always'

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

function man() {
        env \
                LESS_TERMCAP_md=$(printf "\e[1;36m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[1;32m") \
                man "$@"
}

function yamllint() {
        for i in $(find . -name '*.yml' -o -name '*.yaml'); do echo $i; ruby -e "require 'yaml';YAML.load_file(\"$i\")"; done
}

## Display Files without '#'-Comments
alias uncomment='egrep -v "^\s*(#|$)"'

## Using uncomment compined with grep
function cgrep() {
  uncomment $2 | egrep $1
}
