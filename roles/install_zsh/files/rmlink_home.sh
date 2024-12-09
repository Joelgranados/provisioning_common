#! /usr/bin/env zsh

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/src/prezto/runcoms/^README.md(.N); do
  if [ -f "${ZDOTDIR:-$HOME}/.${rcfile:t}" ] ; then
    echo "rm \"${ZDOTDIR:-$HOME}/.${rcfile:t}\""
    rm "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  fi
done
