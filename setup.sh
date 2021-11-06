#!/usr/bin/env bash 

if [ $SPIN ]; then
  git config --global --unset-all credential.helper
  echo "hello"
fi
