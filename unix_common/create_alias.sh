#!/bin/bash -euo pipefail

THIS_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"
cd "$THIS_SCRIPT_DIR"

source ../.setup_env
source $SHELL_SOURCE_PATH

info "start setup alias"

echo "\n# >>> alias >>>" >> $SHELL_SOURCE_PATH

# ls
echo '\n# ls' >> $SHELL_SOURCE_PATH
echo 'alias ls="ls --color=auto"' >> $SHELL_SOURCE_PATH
echo 'alias ll="ls -l"' >> $SHELL_SOURCE_PATH
echo 'alias la="ls -A"' >> $SHELL_SOURCE_PATH

# cd
echo '\n# cd' >> $SHELL_SOURCE_PATH
echo 'alias ..="cd .."' >> $SHELL_SOURCE_PATH
echo 'alias ...="cd ../.."' >> $SHELL_SOURCE_PATH
echo 'alias ....="cd ../../.."' >> $SHELL_SOURCE_PATH
echo 'alias .....="cd ../../../.."' >> $SHELL_SOURCE_PATH
echo 'alias ~="cd ~"' >> $SHELL_SOURCE_PATH

# rm
echo '\n# rm' >> $SHELL_SOURCE_PATH
echo 'alias rm="rm -vrl"' >> $SHELL_SOURCE_PATH

# cat
echo '\n# cat' >> $SHELL_SOURCE_PATH
echo 'alias cat="cat -sn"' >> $SHELL_SOURCE_PATH

# mv
echo '\n# mv' >> $SHELL_SOURCE_PATH
echo 'alias mv="mv -vi"' >> $SHELL_SOURCE_PATH


echo "\n# <<< alias <<<" >> $SHELL_SOURCE_PATH


source $SHELL_SOURCE_PATH
info "setup alias success"
