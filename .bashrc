#!/bin/bash

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/bin/
export CHROME_BIN=/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary
export ANDROID_HOME=/usr/local/opt/android-sdk

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source ~/.secrets
source ~/.git-completion.sh

alias fit="cut -c1-$(stty size <&2 | cut -d' ' -f2)"
alias chrome="open -a Google\ Chrome\ Canary --args --disable-web-security"
alias vimr='open -a "VimR"'
alias vim=mvim
alias vi=mvim
export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a iTerma"'

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
chpwd

set -o vi
ulimit -n 2048
ulimit -u 1024


