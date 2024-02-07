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

- **CleanMyMac**: An app that monitors your system and recommends data to purge. Install with 
```sh
$ brew install --cask cleanmymac
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

- **Notion**: An all-in-one workspace where you can write, plan, collaborate, and get organized. Install with 
```sh
$ brew install --cask notion
```

## Browsers

- **Arc**: A fast, full-featured browser. Install with 
```sh
$ brew install --cask arc
```

- **Chrome**: Google's web browser, known for its speed and simplicity. Install with 
```sh
$ brew install --cask google-chrome
```

- **Brave**: A browser 
```sh
$ brew install --cask brave
```

## Development Tools

- **Docker**: An open platform for developing, shipping, and running applications. Install with 
```sh
$ brew install docker
```

- **Jetbrains Toolbox**: A control panel for your tools and projects. Install with 
```sh
$ brew install --cask jetbrains-toolbox
```

- **WebStorm**: The smartest JavaScript IDE by JetBrains. Install with 
```sh
$ brew install --cask webstorm
```

- **VSCode**: A lightweight but powerful source code editor by Microsoft. Install with 
```sh
$ brew install --cask visual-studio-code
```

- **Fig**: Autocomplete for your terminal. Install with 
```sh
$ brew install --cask fig
```

## SDKs

### 1. Dotnet and Node

```sh
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

Once you have completed these steps, your development setup is complete!

---

Feel free to clone this repository and modify it according to your own needs. You may also contribute to this repository by creating a pull request.
