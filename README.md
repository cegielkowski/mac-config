# macOS Setup Guide

This repository is intended to simplify the setup of a new Mac machine, providing an automated way to install commonly used applications, developer tools, and to configure shell environments with dotfiles.

The repository is structured as follows:

- install
  - base_apps.sh
  - bash_config.sh
  - dev_config.sh
  - install.sh
- dotfiles
  - alacritty
    - install.sh
    - link.prop
    - alacritty.yml
  - starship
    - install.sh
    - link.prop
    - starship.toml
  - tmux
    - install.sh
    - link.prop
    - tmux.conf
  - zsh
    - install.sh
    - link.prop
    - .zshrc
  - others
    - install.sh
- README.md


## Installation

Clone this repository to your local machine and run the `install.sh` script from the `install` directory:

```sh
$ git clone https://github.com/yourusername/yourrepository.git
$ cd yourrepository/install
$ chmod +x install.sh
$ ./install.sh
```


# Manual Installation

This repository is for setting up a new macOS environment. It contains the Homebrew formulae for most used applications, along with a `.dotfiles` folder for installing frequently used bash command line interfaces.

To use these, you will first need to have Homebrew installed on your system. If not installed, open Terminal and paste the following command:

```sh
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Below are the applications included in this setup and their Homebrew formulae:

## Productivity and Utilities

- **Surfshark**: A fast and secure VPN for privacy & security. Install with 
```sh
$ brew install --cask surfshark
```

- **AlDente**: Allows your MacBook battery to charge only up to a certain limit to prevent battery wear. Install with 
```sh
$ brew install --cask aldente
```

- **CleanMyMac**: An app that monitors your system and recommends data to purge. Install with 
```sh
$ brew install --cask cleanmymac
```

- **One Switch**: All your powerful switches in one place. Install with 
```sh
$ brew install --cask one-switch
```

- **CleanShot**: An app that makes it easier to capture and manage screenshots. Install with 
```sh
$ brew install --cask cleanshot
```

- **HiddenBar**: An app that lets you hide menu bar items to keep your workspace tidy. Install with 
```sh
$ brew install --cask hiddenbar
```

- **Elmedia Player**: A media player that supports a wide range of video and audio formats. Install with 
```sh
$ brew install --cask elmedia-player
```

- **Raycast**: Makes it easy to control your tools with a few keystrokes. Install with 
```sh
$ brew install --cask raycast
```

- **Xnip**: A screenshot and annotation tool. Unfortunately, there is no cask available for Xnip. You can download it from the official [website](https://www.xnipapp.com/).

## Cloud Storage

- **OneDrive**: Microsoft's cloud storage solution. Install with 
```sh
$ brew install --cask onedrive
```

## Communication

- **Slack**: A collaboration hub for work, no matter what work you do. Install with 
```sh
$ brew install --cask slack
```

- **WhatsApp**: Freeware, cross-platform messaging and Voice over IP service. Install with 
```sh
$ brew install --cask whatsapp
```

## Media & Entertainment

- **Spotify**: A digital music, podcast, and video streaming service. Install with 
```sh
$ brew install --cask spotify
```

## Office Suite

- **Microsoft Word**: A word processor included in Microsoft Office suite. Install with 
```sh
$ brew install --cask microsoft-word
```

- **Microsoft PowerPoint**: A powerful presentation software developed by Microsoft. Install with 
```sh
$ brew install --cask microsoft-powerpoint
```

- **Microsoft Excel**: Microsoft's leading spreadsheet program. Install with 
```sh
$ brew install --cask microsoft-excel
```

- **Notion**: An all-in-one workspace where you can write, plan, collaborate, and get organized. Install with 
```sh
$ brew install --cask notion
```

## Browsers

- **Firefox**: A fast, full-featured browser from Mozilla. Install with 
```sh
$ brew install --cask firefox
```

- **Chrome**: Google's web browser, known for its speed and simplicity. Install with 
```sh
$ brew install --cask google-chrome
```

- **Opera**: A browser that includes built-in ad blocking and VPN. Install with 
```sh
$ brew install --cask opera
```

- **Edge**: Microsoft's speedy browser that comes with excellent privacy features. Install with 
```sh
$ brew install --cask microsoft-edge
```

## Development Tools

- **Docker**: An open platform for developing, shipping, and running applications. Install with 
```sh
$ brew install docker
```

- **GitKraken**: A Git GUI that helps make sense of Git. Install with 
```sh
$ brew install --cask gitkraken
```

- **Jetbrains Toolbox**: A control panel for your tools and projects. Install with 
```sh
$ brew install --cask jetbrains-toolbox
```

- **WebStorm**: The smartest JavaScript IDE by JetBrains. Install with 
```sh
$ brew install --cask webstorm
```

- **Rider**: A fast & powerful cross-platform .NET IDE by JetBrains. Install with 
```sh
$ brew install --cask rider
```

- **VSCode**: A lightweight but powerful source code editor by Microsoft. Install with 
```sh
$ brew install --cask visual-studio-code
```

- **Azure Data Studio**: A data management tool that enables working with SQL Server, Azure SQL DB and SQL DW. Install with 
```sh
$ brew install --cask azure-data-studio
```

- **Fig**: Autocomplete for your terminal. Install with 
```sh
$ brew install --cask fig
```

## SDKs

### 1. Dotnet and Node

```sh
$ brew install --cask dotnet-sdk
$ brew install node
```

Node Package Manager (npm) comes with node, so there is no need to install it separately. 

For pnpm, you can use npm to install it:

```sh
$ npm install -g pnpm
```

### 2. Python

You can install Python using Homebrew with the following command:

```sh
$ brew install python
```

## 4. SQL Server

Pull the Docker images for SQL Server using the following command:

```sh
$ docker pull mcr.microsoft.com/mssql/server:2019-latest
```

Next, run the SQL Server Docker image with the specified environment variables and ports:

```sh
$ docker run --name sql_server_2019 -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=SqlServer*123' -e 'MSSQL_PID=Express' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest
```

## 5. MongoDB

First, you will need to add the MongoDB tap in Homebrew:

```sh
$ brew tap mongodb/brew
```

Next, you can install MongoDB with the following command:

```sh
$ brew install mongodb-community@6.0
```

Finally, you can run MongoDB using the following command:

```sh
$ mongod --config /usr/local/etc/mongod.conf --fork
```

Once you have completed these steps, your development setup is complete!

---

Feel free to clone this repository and modify it according to your own needs. You may also contribute to this repository by creating a pull request.