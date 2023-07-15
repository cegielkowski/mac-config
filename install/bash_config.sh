#!/bin/bash

# Set the location of your dotfiles directory
export DOTFILES="$HOME/.dotfiles"

# List all the components you want to install
components=(alacritty zsh starship tmux others)

# Process each component one by one
for component in "${components[@]}"; do
  # Navigate to the directory for this component within your dotfiles
  cd "$DOTFILES/$component" || exit

  # Give executable permissions to the installation script
  chmod +x install.sh

  # Check if the component is already installed
  if which "$component" >/dev/null; then
    # Ask the user if they want to reinstall the component
    read -r -p "$component is already installed. Do you want to reinstall it? (y/n) " reinstall_choice
    if [[ "$reinstall_choice" =~ ^[Yy] ]]; then
      # If they chose to reinstall, run the install script for this component
      ./install.sh
    else
      echo "Skipping installation of $component."
    fi
  else
    # If the component is not installed, run the install script
    ./install.sh
  fi

  # If there is a links.prop file for this component, read it
  if [ -f links.prop ]; then
    while IFS="=" read -r -a link; do
      # Check if the target of the symbolic link already exists
      if [ -e "$HOME/${link[1]}" ]; then
        # Ask the user if they want to replace the existing file
        read -r -p "$HOME/${link[1]} already exists. Do you want to replace it? (y/n) " replace_choice
        if [[ "$replace_choice" =~ ^[Yy] ]]; then
          # If they chose to replace, delete the existing file
          rm -f "$HOME/${link[1]}"
        else
          echo "Skipping linking of ${link[0]}."
          continue
        fi
      fi
      # Ensure the directory exists and create a new symbolic link
      mkdir -p "$(dirname "$HOME/${link[1]}")"
      ln -s "${link[0]}" "$HOME/${link[1]}"
    done < links.prop
  fi
done

# Return to the user's home directory
cd "$HOME" || exit
