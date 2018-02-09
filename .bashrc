#!/bin/bash

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

export PATH=$PATH:~/bin
export PATH=$HOME/.fastlane/bin:$PATH
export PATH=$PATH:~/Library/Android/sdk/platform-tools
export PATH="/usr/local/opt/tomcat@7/bin:$PATH"

export CATALINA_HOME="/usr/local/opt/tomcat@7"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

alias fit="cut -c1-$(stty size <&2 | cut -d' ' -f2)"
alias chrome="open -a Google\ Chrome --args --disable-web-security --user-data-dir=/Users/jonathan.dart/Library/Application\ Support/Google/Chrome/"
alias vim=nvim
alias vi=nvim
alias kmcaf='sudo launchctl unload /Library/LaunchDaemons/com.mcafee.* && pkill "McAfee Reporter" && pkill Menulet'
ulimit -n 65536 65536

cd () { builtin cd "$@" && chpwd; }
pushd () { builtin pushd "$@" && chpwd; }
popd () { builtin popd "$@" && chpwd; }
chpwd () {
  if [[ $PATH = */node_modules/.bin ]]; then
    PATH=${PATH%:*}
  fi
  if [[ $PWD =~ ^"$HOME/dev/"[^/]* ]]; then
    PATH=$PATH:$PWD/node_modules/.bin
  fi
}
launchctlFind () {
  LaunchctlPATHS=( \
    ~/Library/LaunchAgents \
    /Library/LaunchAgents \
    /Library/LaunchDaemons \
    /System/Library/LaunchAgents \
    /System/Library/LaunchDaemons \
  )

  for curPATH in "${LaunchctlPATHS[@]}"; do
    grep -r "$curPATH" -e "$1"
  done
  return 0;
}
chpwd

set -o vi
