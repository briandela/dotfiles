# Install Homebrew if not found
brew --version
if [[ $? -ne 0 ]]; then
    # Clean-up failed Homebrew install
    rm -rf "/usr/local/Cellar" "/usr/local/.git"
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade brew-cask
brew upgrade --all

# Include duplicates packages
brew tap homebrew/dupes

# Install Cask
brew install brew-cask
brew tap caskroom/cask
brew tap caskroom/versions

# Brews
brew install go
brew install mtr
brew install node
brew install postgresql
brew install ssh-copy-id
brew install watch
brew install wget

# Casks
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Casks: Dev
brew cask install dockertoolbox
brew cask install heroku-toolbelt
brew cask install sourcetree
brew cask install sublime-text
brew cask install vagrant
brew cask install visual-studio-code 

# Casks: tools/misc
brew cask install adobe-reader
brew cask install atom
brew cask install caffeine
brew cask install cheatsheet
brew cask install cyberduck
brew cask install flux
brew cask install google-chrome
brew cask install google-drive
brew cask install macdown
brew cask install skype
brew cask install spectacle
brew cask install superduper
brew cask install vlc

# Casks: osx quick look
brew cask install betterzipql
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlprettypatch
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install suspicious-package

# Clean things up
brew linkapps
brew cleanup
brew prune
brew cask cleanup
