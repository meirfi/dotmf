#! /bin/bash

# config files
ln -sf $HOME/.synced/dotfiles/config/i3 $HOME/.config/
ln -sf $HOME/.synced/dotfiles/config/sway $HOME/.config/
ln -sf $HOME/.synced/dotfiles/config/rofi $HOME/.config/
ln -sf $HOME/.synced/dotfiles/config/alacritty $HOME/.config/
ln -sf $HOME/.synced/dotfiles/config/paru $HOME/.config/
ln -sf $HOME/.synced/dotfiles/config/eww $HOME/.config/

# shell
ln -sf $HOME/.synced/dotfiles/config/.bashrc $HOME/
ln -sf $HOME/.synced/dotfiles/config/.bash_profile $HOME/

# theme settings
ln -sf $HOME/.synced/dotfiles/config/.gtkrc-2.0 $HOME/
ln -sf $HOME/.synced/dotfiles/config/gtk3-settings.ini $HOME/.config/gtk-3.0/settings.ini
ln -sf $HOME/.synced/dotfiles/config/default $HOME/.icons/

# fonts
ln -sf $HOME/.synced/dotfiles/config/powericons.ttf $HOME/.local/share/fonts
