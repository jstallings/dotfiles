
# Set reasonable OS X defaults
# Original idea and settings from 
# https://github.com/holman/dotfiles/
#
# Run ./set-defaults.sh the first time



#Use AirDrop over every interface
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

#Always open everything in Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

#Show the ~/Library folder
chflags nohidden ~/Library

