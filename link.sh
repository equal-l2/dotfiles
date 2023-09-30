#!/bin/sh
platform=$(uname)
echo "Platform: $platform"

function fancy_link() {
  local from=$1
  local to=$2
  echo "[Link] $1 -> $2"
  ln -ns `realpath $1` $2
}

if [[ $platform == "Darwin" ]]; then
  fancy_link .zshrc ~/.zshrc
  fancy_link .gitconfig.macos ~/.gitconfig
else

	echo "[Warn] .zshrc (for macOS) not linked because you are on \"$platform\""

  fancy_link .gitconfig.linux ~/.gitconfig
fi

fancy_link config.toml ~/.cargo/config.toml 
fancy_link nvim/init.lua ~/.config/nvim/init.lua 
fancy_link nvim/lua ~/.config/nvim/lua 
