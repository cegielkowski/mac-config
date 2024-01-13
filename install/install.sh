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
fi

brew install gum

# Execute each script
for script in "${scripts[@]}"; do
    chmod +x $script
    ./$script
done
