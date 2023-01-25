#!/bin/bash -euo pipefail
# 参考 https://dev-yakuza.posstree.com/environment/configure-development-environment-on-mac-with-homebrew-and-shell-script/

THIS_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"
cd "$THIS_SCRIPT_DIR"

# homebrewのインストール
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Brewfileからインストール
brew bundle --file=./Brewfile
