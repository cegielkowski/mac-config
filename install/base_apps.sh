#!/bin/bash

echo "Starting to set up your Mac..."

# Check if Homebrew is installed
if test ! $(which brew); then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

echo "Installing apps..."

# List of apps to install
apps=(
    surfshark
    aldente
    caffeine
    cleanmymac
    one-switch
    cleanshot
    hiddenbar
    elmedia-player
    raycast
    onedrive
    slack
    whatsapp
    spotify
    microsoft-word
    microsoft-powerpoint
    microsoft-excel
    notion
    firefox
    google-chrome
    opera
    microsoft-edge
    docker
    gitkraken
    jetbrains-toolbox
    webstorm
    rider
    visual-studio-code
    azure-data-studio
    fig
)

# Install apps
for app in "${apps[@]}"; do
    brew install --cask $app
done

echo "Setup completed!"
