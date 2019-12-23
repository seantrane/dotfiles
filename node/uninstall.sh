#!/usr/bin/env bash
#
# Uninstall Node.js, npm and all node_modules

echo

# Remove global node_modules
{
    sudo rm -Rf \
        "/usr/local/include/node_modules" \
        "/usr/local/include/node" \
        "/usr/local/lib/node_modules" \
        "/usr/local/lib/node"
}
echo "~> Removed global node_modules."
echo

# Uninstall npm
if test "$(command -v npm)"; then
    npm uninstall -g npm
    echo "~> Uninstalled npm."
    echo
fi

# Uninstall Node.js
if [[ "$(brew ls --versions node)" ]]; then
    brew uninstall node
    brew cleanup
    echo "~> Uninstalled Node.js."
    echo
fi

# Remove all files for Node/modules
{
    sudo rm -Rf \
        "/opt/local/bin/node" \
        "/opt/local/include/node" \
        "/opt/local/lib/node_modules"
        "/usr/local/bin/node" \
        "/usr/local/bin/npm" \
        "/usr/local/lib/dtrace/node.d" \
        "/usr/local/share/man/man1/node.1" \
        "$HOME/.node-gyp" \
        "$HOME/.node" \
        "$HOME/.npm" \
        "$HOME/include/node_modules" \
        "$HOME/include/node" \
        "$HOME/lib/node_modules" \
        "$HOME/lib/node" \
        "$HOME/node_modules" \
        "$HOME/node"
} < /dev/null 2> /dev/null

echo "~> Removed all files for Node/modules."
echo
echo "\033[1;32m~> All traces of Node.js, npm, and modules have been removed!\033[0m"
echo
