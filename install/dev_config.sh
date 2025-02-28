#!/bin/bash

# Start message
gum style --border rounded --padding 2 "🚀 Starting to set up your dev environment..."

# Update Homebrew
gum spin --title "🔄 Updating Homebrew..." -- brew update

gum style --border double --padding 2 "🛠️ Installing dev tools..."

# List of dev tools to install
devtools=(
    node
    python3
    pnpm
    nvm
    go
    neovim
)

# Install dev tools
for tool in "${devtools[@]}"; do
    echo "📥 Installing $tool..."
    echo " "

    # Determine if the tool should be installed as a cask or not
    if [[ "$tool" == "dotnet-sdk" || "$tool" == "bun" || "$tool" == "nvm" ]]; then
        brew install --cask "$tool"
    else
        brew install "$tool"
    fi
    
    echo " "
    echo "✅ Finished installing $tool."
    echo " "
done

# Check if Docker is installed
if ! command -v docker &>/dev/null; then
    gum style --border rounded --padding 1 --foreground "red" "⚠️ Docker could not be found, please install Docker first."
    exit
fi

# Pull Docker images for SQL Server
gum spin --title "Pulling Docker images for SQL Server..." -- docker pull mcr.microsoft.com/mssql/server:2019-latest

# Run SQL Server Docker image
gum spin --title "Running SQL Server Docker image..." -- docker run --name sql_server_2019 -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=SqlServer*123' -e 'MSSQL_PID=Express' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest

# Install MongoDB
gum spin --title "Installing MongoDB..." -- brew tap mongodb/brew && brew install mongodb-community@6.0

# Run MongoDB
gum spin --title "Running MongoDB..." -- mongod --config /usr/local/etc/mongod.conf --fork

# Completion message
gum style --border double --padding 1 "✅ Dev setup completed!"
