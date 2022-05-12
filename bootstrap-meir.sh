#!/usr/bin/env bash
#
# bootstrap installs things.
required_packages=( bash kitty fontconfig git vim tmux git )
backup_dotfiles=( .bashrc .bash_profile .vimrc .gitconfig )

backup_dotfiles=(.Xmodmap .xinitrc .bash_profile .bashrc .xmonad .xmobarrc \
             .wgetrc .gitconfig .latexmkrc .ctags .clang-format .clang-tidy \
             .jshintrc .pep8 .tmux.conf .config/zathura/zathurarc \
             .mplayer/config .config/matplotlib/matplotlibrc \
             .vimrc .config/nvim/init.vim .config/nvim/ginit.vim \
             .config/nvim/dein .config/pycodestyle .lesskey)
TARGET_DIRS=( .dotfiles )



cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}


create_link() {
    local dot_target=$1
    local home_target=$2
    if [ $platform == 'Windows' ]; then
        echo "cp -r $dot_target $home_target"  # Copy
        cp -r $dot_target $home_target
    else
        echo "ln -s $dot_target $home_target"  # Soft link
        ln -sf $dot_target $home_target
    fi
}

create_directory_link(){
    local dot_target=$1
    local home_target=$2

    if ! -d ${dot_target} ; then
      
    fi
}

create_link_prompt() {
    local dot_target=$1
    local home_target=$2

    # Check file existence
    if [ ! -e $dot_target ]; then
        echo "[Error] not exist $dot_target"
    elif [ -e $home_target ]; then
        # Check difference
        difference=`diff -r $dot_target $home_target`
        if [ "$difference" == "" ]; then
            echo "[Skip] Already exists. No difference ($home_target)"
        else
            echo "[Ask] Already exists. ($home_target)"
            echo "$difference"
            echo -n "Overwrite? [y/n] "
            ret=`yn_prompt`
            if [ $ret -eq 0 ]; then
                # Backup and create new link
                home_backup="$home_target"_
                if [ -e $home_backup ]; then
                    echo "rm -r $home_backup"
                    rm -r $home_backup
                fi
                echo "mv $home_target $home_backup"
                mv $home_target $home_backup
                create_link $dot_target $home_target
            fi
        fi
    else
        create_link $dot_target $home_target
    fi
}

function backup_original_files() {
  # backup files before running bootstrap


}