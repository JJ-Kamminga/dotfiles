# Ask for the administrator password upfront
sudo -v

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "
## set screen capture location
mkdir -p ~/documents/afbeeldingen/screenshots
defaults write com.apple.screencapture location -string "~/documents/afbeeldingen/screenshots"
## Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
## Disable mouse acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1

###############################################################################
# Activity Monitor                                                            #
###############################################################################
# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5
# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0
# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0
