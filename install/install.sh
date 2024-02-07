#!/bin/bash

# Copy the dotfiles to the home directory
cp -r ../dotfiles ~/.dotfiles

# List of scripts to execute
scripts=(
    base_apps.sh
    dev_config.sh
    bash_config.sh
)

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(homebrew/bin/brew shellenv)"
fi

# Install gum using Homebrew
brew install gum

# Execute each script with confirmation
for script in "${scripts[@]}"; do
    # Ask for confirmation before running the script
    if gum confirm "Do you want to run $script?"; then
        chmod +x "$script"
        ./"$script"
    else
        echo "Skipping $script"
    fi
done
