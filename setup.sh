#!/bin/bash

platform=`uname`
workingDirectory=`pwd`

clone=( \
  https://github.com/gioele/bashrc_dispatch.git \
  https://github.com/revans/bash-it.git \
  https://github.com/joyent/node.git \
  https://github.com/gmarik/vundle.git \
)

backup=( \
  .bashrc \
  .bash_profile \
  .profile \
  .bash_login \
)

repositories=$HOME/repositories
setup=$repositories/setup
bash=$setup/bash
ssh=$setup/ssh
vim=$setup/vim
tmux=$setup/tmux
screen=$setup/screen
support=$setup/support

function initializePlatform {
  if [[ "$platform" == 'Darwin' ]]; then
    # Handle an OSX system - assumes XCode is installed (LAME!)...
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

    brew install git
    brew install macvim
    brew install tmux
    brew install wget
  else
    # Handle an Ubuntu system...
    sudo apt-get -yq update
    sudo apt-get -yq upgrade
    sudo apt-get -yq install aptitude git build-essential openssh-server vim tmux
  fi
}

function initializeRepositories {
  mkdir -p $repositories
  cd $repositories

  git clone https://github.com/cdata/setup.git

  mkdir -p $support
  cd $support

  for repository in "${clone[@]}"; do
    git clone $repository
  done

  ln -s $support/node $repositories/node
}

function initializeDotFiles {
  cd ~/

  # Backup default stuff..
  for bashconfig in "${backup[@]}"; do
    if [[ -e $bashconfig ]]; then
      mv $bashconfig $bashconfig.backup
    fi
  done

  # Vundler..
  mkdir -p $HOME/.vim/bundle
  ln -s $support/vundle $HOME/.vim/bundle/vundle

  # Bash dispatcher..
  bashrc_dispatch=$support/bashrc_dispatch/bashrc_dispatch

  ln -s $bashrc_dispatch ./.bashrc
  ln -s $bashrc_dispatch ./.bash_profile
  ln -s $bashrc_dispatch ./.profile
  ln -s $bashrc_dispatch ./.bash_login

  ln -s $bash/rc_all $HOME/.bashrc_all
  ln -s $bash/rc_interactive $HOME/.bashrc_interactive
  ln -s $bash/rc_login $HOME/.bashrc_login
  ln -s $bash/rc_script $HOME/.bashrc_script

  # Tmux
  ln -s $tmux/tmux.conf $HOME/.tmux.conf

  # Screen
  ln -s $screen/screenrc $HOME/.screenrc

  # SSH
  mkdir -p $HOME/.ssh
  ln -s $ssh/publickeys $HOME/.ssh/authorized_keys

  # Vim
  ln -s $vim/vimrc $HOME/.vimrc
  ln -s $vim/gvimrc $HOME/.gvimrc

  # Bash-it
  ln -s $support/bash-it $HOME/.bash_it
  mkdir -p $support/bash-it/themes/cdata
  ln -s $bash/cdata.theme.bash $support/bash-it/themes/cdata/cdata.theme.bash
}

function initializeVim {
  vim +BundleInstall +qall
}

function selfDestruct {
  rm $workingDirectory/$0
}

initializePlatform
initializeRepositories
initializeDotFiles
initializeVim
selfDestruct

