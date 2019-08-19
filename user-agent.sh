#!/usr/bin/env bash

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

echo export SSH_AUTH_SOCK="~/.ssh/ssh_auth_sock"
ssh-add -l > /dev/null || ssh-add ~/.ssh/intempus ~/.ssh/id_rsa


