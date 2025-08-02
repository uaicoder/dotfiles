#!/bin/bash

echo "🔗 Creating symlinks..."

# i3 config
mkdir -p ~/.config/i3
ln -sf ~/dotfiles/i3/config ~/.config/i3/config

# Neovim config
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/nvim/after ~/.config/nvim/after
ln -sf ~/dotfiles/nvim/lua ~/.config/nvim/lua
ln -sf ~/dotfiles/nvim/plugin ~/.config/nvim/plugin
ln -sf ~/dotfiles/nvim/utils ~/.config/nvim/utils

# Compton config
ln -sf ~/dotfiles/compton.conf ~/.config/compton.conf

# Zsh config (optional)
ln -sf ~/dotfiles/.zshrc ~/.zshrc

echo "✅ All symlinks created."

