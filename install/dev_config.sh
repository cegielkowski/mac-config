#!/bin/bash

echo "Starting to set up your dev environment..."

# Update Homebrew
brew update

echo "Installing dev tools..."

# List of dev tools to install
devtools=(
    dotnet-sdk
    node
)

# Install dev tools
for tool in "${devtools[@]}"; do
    brew install --cask $tool
done

# Node package manager comes with node. No need to install separately.
# For pnpm, we can use npm to install
npm install -g pnpm

# Install Python
brew install python

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker could not be found, please install Docker first."
    exit
fi

# Pull the Docker images for SQL Server
docker pull mcr.microsoft.com/mssql/server:2019-latest

# Run SQL Server Docker image with specified environment variables and ports
docker run --name sql_server_2019 -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=SqlServer*123' -e 'MSSQL_PID=Express' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest

# Install MongoDB
brew tap mongodb/brew
brew install mongodb-community@6.0

# Run MongoDB
mongod --config /usr/local/etc/mongod.conf --fork

echo "Dev setup completed!"
