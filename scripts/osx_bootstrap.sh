#!/usr/bin/env bash
echo "Starting bootstrapping"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

PACKAGES=(
    git
    tree
    httpie
    curl
    wget
    zsh
    vim
    tmux
    ack
    node
    python
    python3
    terminal-notifier
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew install caskroom/cask/brew-cask

CASKS=(
    google-chrome
    firefox
    slack
    iterm2
    caffeine
    docker
    emacs
    1password
    alfred
    spotify
    telegram
    steam
    skype
    spectacle
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Installing global npm packages..."
npm install gulp -g
npm install tern -g
npm install js-beautify -g
npm install eslint -g
npm install create-react-app -g
npm install surge -g

echo "Configuring OSX..."

# Set fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Bootstrapping complete"
