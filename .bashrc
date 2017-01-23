#!/bin/bash

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
	GIT_PROMPT_THEME=Default
	source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:~/.composer/vendor/bin
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/bin
export CHROME_BIN=/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary
export ANDROID_HOME=/usr/local/opt/android-sdk

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source ~/.secrets
source ~/.git-completion.sh

alias fit="cut -c1-$(stty size <&2 | cut -d' ' -f2)"
alias chrome="open -a Google\ Chrome\ Canary --args --disable-web-security --user-data-dir=/Users/jonathan.dart/Library/Application\ Support/Google/Chrome/Default"
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
ulimit -n 5000

alias doc='docker-machine start default && eval "$(docker-machine env default)"'

launchctlFind () {
    LaunchctlPATHS=( \
        ~/Library/LaunchAgents \
        /Library/LaunchAgents \
        /Library/LaunchDaemons \
        /System/Library/LaunchAgents \
        /System/Library/LaunchDaemons \
    )

    for curPATH in "${LaunchctlPATHS[@]}"
    do
        grep -r "$curPATH" -e "$1"
    done
    return 0;
}

alias kmcaf='sudo launchctl unload /Library/LaunchDaemons/com.mcafee.* && pkill "McAfee Reporter" && pkill Menulet'
