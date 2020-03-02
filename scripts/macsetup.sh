#!/bin/bash

# Install XCode and Brew
# ----------------------
# Required for most things below
sudo xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew Utils
# ----------
# bash - Updated version of bash
# macvim - Updated version of vim
# git - Updated version of git
# npm - Latest NPM and Node
# jq - JSON parsing/highlighting
# watch - Reloads stdout of command every 2 seconds
# tree - displays file tree
# ripgrep - Fast, pretty recursive grep
# fzf - Fuzzy recursive file finder
# rectangle - Window manager that Mac should have come with

brew install bash macvim git npm jq watch tree ripgrep fzf
brew cask install rectangle

# Symlinks
# --------
ln -s ../.vimrc ~/.vimrc
ln -s ../.profile ~/.profile
ln -s /usr/bin/python3 /usr/local/bin/python # Sets python3 as default

sudo python -m pip install --upgrade pip # Upgrade pip
sudo python -m pip install grip # Install Markdown dev server

# Setup VIM Plugins
# -----------------
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
