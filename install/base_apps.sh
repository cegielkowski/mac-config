#!/bin/bash

# Global arrays for installed and uninstalled apps
installed_apps=()
uninstalled_apps=()

# Function to check if an app is installed
installed_casks=$(brew list --cask)

is_installed() {
  if [[ $installed_casks == *"$1"* ]]; then
    echo "Installed"
  else
    echo "Not Installed"
  fi
}

# Function to display apps in a table format
display_apps_table() {
  local apps=("$@")
  printf "%-20s | %-15s\n" "App" "Status"
  printf "%-20s | %-15s\n" "--------------------" "---------------"
  for app in "${apps[@]}"; do
    status=$(is_installed "$app")
    printf "%-20s | %-15s\n" "$app" "$status"
    if [ "$status" = "Not Installed" ]; then
      uninstalled_apps+=("$app")
    else
      installed_apps+=("$app")
    fi
  done
}

# Using Gum to enhance echo statements
gum style --border double --border-foreground "green" --margin 1 --padding 1 --foreground "skyblue" --bold "✨ Powering up your Mac setup! ✨"
gum style --border double --border-foreground "yellow" --margin "1" --padding "1" --foreground "blue" "🚀 Starting to set up your Mac..."

# Update Homebrew
gum spin --title "🔄 Updating Homebrew..." -- brew update

gum style --border double --border-foreground "cyan" --margin "1" --padding "1" "📦 Preparing to install apps..."

# List of apps to install
apps=(
  surfshark
  aldente
  caffeine
  cleanmymac
  one-switch
  cleanshot
  hiddenbar
  cakebrew
  elmedia-player
  raycast
  slack
  whatsapp
  spotify
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
  microsoft-office
)

app_selection() {
  # Options for user to choose how to proceed with app installation
  options=("Select All Apps" "Filter and Select Uninstalled Apps" "Choose Manually")

  user_choice=$(gum choose \
    --cursor="→ " \
    --cursor-prefix="○ " \
    --selected-prefix="◉ " \
    --unselected-prefix="○ " \
    --header="Select an Option" \
    --cursor.foreground="#1E90FF" \
    --selected.foreground="#FFD700" \
    -- "${options[@]}")

  if [ "$user_choice" = "Select All Apps" ]; then
    selected_apps=("${apps[@]}")
  elif [ "$user_choice" = "Filter and Select Uninstalled Apps" ]; then
    # Check if there are uninstalled apps
    if [ ${#uninstalled_apps[@]} -eq 0 ]; then
      gum style --border rounded --padding "1" "No uninstalled apps found. Returning to previous menu."
      app_selection # Recall the function to return to previous menu
      return
    fi

    selected_apps=("${uninstalled_apps[@]}")
  elif [ "$user_choice" = "Choose Manually" ]; then
    # Allow user to manually select apps
    formatted_apps=("${apps[@]}")
    selected_apps=($(gum choose --cursor-prefix "[ ] " --selected-prefix "[✓] " --no-limit -- "${formatted_apps[@]}" | awk '{print $1}'))
  fi
}

# Display all apps with their status
display_apps_table "${apps[@]}"

echo " "

app_selection # Call the function to handle app selection

# Confirm with the user before proceeding with installation
if [ ${#selected_apps[@]} -gt 0 ]; then
  apps_output=$(printf "%s\n" "${selected_apps[@]}")

  echo -e "Selected Apps\n$apps_output" | gum style --border double --margin 1 --padding 1

  if gum confirm "💡 Do you want to proceed with the installation?"; then
      for app in "${selected_apps[@]}"; do
          if [ "$(is_installed "$app")" = "Not Installed" ]; then
              echo "📥 Installing $app..."
              echo " "

              brew install --cask "$app"

              echo " "
              echo "✅ Finished installing $app."
              echo " "
          fi
      done
      gum style --border double --border-foreground "green" --margin "1" --padding "1" "✅ Setup completed!"
  else
      gum style --border rounded --border-foreground "orange" --padding "1" "❌ Installation cancelled."
  fi
else
  gum style --border rounded --border-foreground "orange" --padding "1" "❌ No apps selected for installation."
fi
