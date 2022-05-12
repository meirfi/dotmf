#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And also installs Homebrew Packages
# And sets Sublime preferences
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1

# dotfiles directory
dotfiledir=${homedir}/.dotfiles

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc bash_prompt aliases private"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Download Git Auto-Completion
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" > ${homedir}/.git-completion.bash

# Run the Homebrew Script
./brew.sh

# Run the Sublime Script
./sublime.sh

#/bin/sh

# PARAMETER
# - $1 : file destination
# - $2 : source file
link_file () {
    if [ -f "$1" ]; then
        echo "[*] $1 exist. please remove it manually."
    else
        echo "[+] $1 -> $2"
        ln -s $2 $1
    fi
}

# link dotfiles
link_file $HOME/.zshrc $MYDOTFILES/zsh/zshrc
link_file $HOME/.tmux.conf $MYDOTFILES/tmux/tmux.conf
link_file $HOME/.config/alacritty.yml $MYDOTFILES/alacritty/alacritty.yml