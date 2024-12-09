#! /usr/bin/env zsh

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/src/prezto/runcoms/^README.md(.N); do
  if [ ! -f "${ZDOTDIR:-$HOME}/.${rcfile:t}" ] ; then
    echo "ln -s \"$rcfile\" \"${ZDOTDIR:-$HOME}/.${rcfile:t}\""
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  fi
done
