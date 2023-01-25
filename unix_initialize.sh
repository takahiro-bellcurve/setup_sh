#!/bin/bash -euo pipefail

THIS_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"
cd "$THIS_SCRIPT_DIR"

SHELL_ENV=`echo $SHELL`
if [ $SHELL_ENV = "/bin/bash" ]; then
  SHELL_SOURCE_PATH=~/.bashrc
  echo "SHELL_SOURCE_PATH=$SHELL_SOURCE_PATH" > .setup_env
elif [ $SHELL_ENV = "/bin/zsh" ]; then
  SHELL_SOURCE_PATH=~/.zshrc
  echo "SHELL_SOURCE_PATH=$SHELL_SOURCE_PATH" > .setup_env
else
  echo "$SHELL is not supported"
  exit 1
fi

echo "enter your PC password"
read -s DEVICE_USER_PASSWORD
echo "DEVICE_USER_PASSWORD=$DEVICE_USER_PASSWORD" >> .setup_env

echo $DEVICE_USER_PASSWORD | sudo -S su

# start install shell-logger
sh ./unix_common/install_shell_logger.sh

echo "successfully ended initializtion"