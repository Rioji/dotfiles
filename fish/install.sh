#!/bin/bash
set -e
cd "$(dirname "${BASH_SOURCE}")";

if [ ! -f /usr/local/bin/fish ]; then
    echo "Installing Fish."
    brew install fish
    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
    echo "Changing default shell to fish..."
    chsh -s /usr/local/bin/fish
fi

echo "Install default configuration"
rsync -avh --no-perms ./.config ~/

exit 0