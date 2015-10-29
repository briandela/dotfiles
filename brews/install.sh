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
brew tap caskroom/cask
brew tap caskroom/versions
brew install brew-cask

# Brews
brew install wget
brew install postgresql
brew install go
brew install node
brew install ssh-copy-id

# Casks
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Casks: Dev
brew cask install otto
brew cask install vagrant
brew cask install sourcetree
brew cask install heroku-toolbelt
brew cask install sublime-text3

# Casks: tools/misc
brew cask install skype
brew cask install flux
brew cask install spectacle
brew cask install adobe-reader
brew cask install cyberduck

# Clean things up
brew linkapps
brew cleanup
brew prune
brew cask cleanup
