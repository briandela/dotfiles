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
brew install node
brew install postgresql
brew install ssh-copy-id
brew install wget

# Casks
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Casks: Dev
brew cask install heroku-toolbelt
brew cask install sourcetree
brew cask install sublime-text3
brew cask install vagrant
brew cask install dockertoolbox

# Casks: tools/misc
brew cask install adobe-reader
brew cask install atom
brew cask install cyberduck
brew cask install flux
brew cask install google-drive
brew cask install macdown
brew cask install skype
brew cask install spectacle
brew cask install vlc

# Clean things up
brew linkapps
brew cleanup
brew prune
brew cask cleanup
