brew install --cask alacritty
brew tap homebrew/cask-fonts
brew search '/font-3270-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true