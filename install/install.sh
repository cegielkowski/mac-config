#!/bin/bash

# Copy the dotfiles to the home directory
cp -r ../dotfiles ~/.dotfiles

# List of scripts to execute
scripts=(
    base_apps.sh
    dev_config.sh
    bash_config.sh
)

# Execute each script
for script in "${scripts[@]}"; do
    chmod +x $script
    ./$script
done