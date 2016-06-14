#!/usr/bin/env bash

# Uninstall Ruby Version Manager (RVM)

sudo rm -rf $HOME/.rvm $HOME/.rvmrc /etc/rvmrc /etc/profile.d/rvm.sh /usr/local/rvm /usr/local/bin/rvm
sudo /usr/sbin/groupdel rvm
echo "RVM is removed. Please check all .bashrc|.bash_profile|.profile|.zshrc for RVM source lines and delete
or comment out if this was a Per-User installation."
