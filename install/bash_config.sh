#!/bin/bash

# Start message
gum style --border rounded --padding 1 "🚀 Starting Dotfiles Setup..."

export DOTFILES="$HOME/.dotfiles"
components=(alacritty starship tmux others zsh)

# Display components to be installed in a rectangle
components_text=$(printf "✨ %s\n" "${components[@]}")
gum style --border double --border-foreground "cyan" --margin 1 --padding 1 --foreground "blue" "Components to be installed: $components_text"

for component in "${components[@]}"; do
  component_dir="$DOTFILES/$component"
  cd "$component_dir" || exit
  chmod +x install.sh

  if which "$component" >/dev/null; then
    # Enhanced prompt for reinstalling
    gum confirm --affirmative "y" --negative "n" -- "Reinstall $component?" && ./install.sh || echo "Skipping installation of $component."
  else
    gum style --border rounded --padding 1 -- "Installing $component..."
    ./install.sh
  fi

  link_prop_file="$component_dir/link.prop"
  if [ -f "$link_prop_file" ]; then

    # Read the single line from link.prop file
    IFS="=" read -r source target < "$link_prop_file"
    echo "Processing link for $source -> $target"
    
    source_path="${source//\$DOTFILES/$DOTFILES}"
    target_path="${target//\$HOME/$HOME}"

    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
      if gum confirm --affirmative "y" --negative "n" -- "$target_path exists. Replace it?"; then
        rm -f "$target_path"
        mkdir -p "$(dirname "$target_path")"
        ln -s "$source_path" "$target_path"
        gum style --border rounded --padding 1 -- "Linked $source_path to $target_path"
      else
        echo "Skipping linking of $source_path."
      fi
    else
      mkdir -p "$(dirname "$target_path")"
      ln -s "$source_path" "$target_path"
      gum style --border rounded --padding 1 -- "Linked $source_path to $target_path"
    fi
  else
    echo "link.prop not found for $component"
  fi
done

cd "$HOME" || exit

source "$HOME/.config/alacritty/alacritty.toml"
source "$HOME/.config/starship.toml"
tmux source-file "$HOME/.tmux.conf"
source "$HOME/.zshrc"

# End message
gum style --border rounded --padding 1 "✅ Dotfiles Setup Complete!"
