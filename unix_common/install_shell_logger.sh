#!/bin/bash -euo pipefail

THIS_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"
cd "$THIS_SCRIPT_DIR"

source ../.setup_env
echo $DEVICE_USER_PASSWORD | sudo -S su

echo "start install shell-logger"
if [ -e /usr/local/shell-logger ]; then
  echo 'shell-logger already installed'
  exit 0
fi

sudo curl -fsSL https://raw.githubusercontent.com/rcmdnk/shell-logger/master/etc/shell-logger -o /usr/local/shell-logger
if [ -e /usr/local/shell-logger ]; then
  echo 'shell-logger install success'
  echo "export shell-logger setup to xxxrc"
  echo '# >>> shell-logger setup >>>' >> $SHELL_SOURCE_PATH
  echo 'source /usr/local/shell-logger' >> $SHELL_SOURCE_PATH
else
  echo 'shell-logger install failed'
  exit 1
fi