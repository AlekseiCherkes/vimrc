#!/bin/bash

set -e 

echo Cloning AlekseiCherkes/vimrc.git into ~/work/vimrc
mkdir -p ~/work
pushd ~/work
git clone --recurse-submodules git@github.com:AlekseiCherkes/vimrc.git 
popd

pushd ~/work/vimrc

echo Installing .vimrc...
ln -s `pwd`/.vimrc ~/

echo Installing .ideavimrc...
ln -s `pwd`/.ideavimrc ~/

echo Installing ~/.config/nvim...
mkdir -p ~/.config
ln -s `pwd` ~/.config/nvim

popd

echo For using Neovim you have to install Packer and activate it in nvim:
echo     packadd packer.nvim

echo OK

