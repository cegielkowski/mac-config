#!/bin/bash

# Start message
gum style --border rounded --padding 1 "🚀 Starting Dotfiles Setup..."

export DOTFILES="$HOME/.dotfiles"
components=(tmux others)

for component in "${components[@]}"; do
  cd "$DOTFILES/$component" || exit
  chmod +x install.sh

  if which "$component" >/dev/null; then
    # Enhanced prompt for reinstalling
    gum confirm --affirmative "y" --negative "n" -- "Reinstall $component?" && ./install.sh || echo "Skipping installation of $component."
  else
    gum style --border rounded --padding 1 -- "Installing $component..."
    ./install.sh
  fi

  if [ -f links.prop ]; then
    while IFS="=" read -r -a link; do
      if [ -e "$HOME/${link[1]}" ]; then
        # Enhanced prompt for replacing files
        gum confirm --affirmative "y" --negative "n" -- "$HOME/${link[1]} exists. Replace it?" && rm -f "$HOME/${link[1]}" || echo "Skipping linking of ${link[0]}."
      fi
      mkdir -p "$(dirname "$HOME/${link[1]}")"
      ln -s "${link[0]}" "$HOME/${link[1]}"
    done <links.prop
  fi
done

cd "$HOME" || exit

# End message
gum style --border rounded --padding 1 "✅ Dotfiles Setup Complete!"
