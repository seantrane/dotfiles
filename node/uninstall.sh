#!/usr/bin/env bash
#
# Uninstall Node.js, npm and all node_modules

echo ""

# Remove global node_modules
sudo rm -rf /usr/local/lib/node
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /usr/local/include/node
sudo rm -rf /usr/local/include/node_modules
echo "~> Removed global node_modules.\n"

# Uninstall npm
if test $(which npm); then
    npm uninstall -g npm
    echo "~> Uninstalled npm.\n"
fi

# Uninstall Node.js
if [ "$(brew ls --versions node)" ]; then
    brew uninstall node
    brew cleanup
    echo "~> Uninstalled Node.js.\n"
fi

# Remove all user files for Node/modules
sudo rm -rf $HOME/.node
sudo rm -rf $HOME/node
sudo rm -rf $HOME/node_modules
sudo rm -rf $HOME/lib/node
sudo rm -rf $HOME/lib/node_modules
sudo rm -rf $HOME/include/node
sudo rm -rf $HOME/include/node_modules
echo "~> Removed all user files for Node/modules.\n"

# Remove all other files for Node/modules
sudo rm -Rf /usr/local/bin/node
sudo rm -Rf /usr/local/bin/npm
sudo rm -rf /usr/local/share/man/man1/node.1
sudo rm -rf /usr/local/lib/dtrace/node.d
sudo rm -rf ~/.npm
sudo rm -rf ~/.node
sudo rm -rf ~/.node-gyp
sudo rm -rf /opt/local/bin/node
sudo rm -rf /opt/local/include/node
sudo rm -rf /opt/local/lib/node_modules
echo "~> Removed all other files for Node/modules.\n"

echo "\033[1;32m~> All traces of Node.js, npm, and modules have been removed!\033[0m\n"
