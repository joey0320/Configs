#!/bin/bash



# Install vim-plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim-plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install nvim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz


# Install nvim
tar -xvzf nvim-linux64.tar.gz
cd nvim-linux64
echo "PATH=$(pwd)/bin:$PATH" >> ~/.bashrc


# Copy over dotfiles
cp .vimrc ~/.vimrc
cp -r nvim ~/.config
