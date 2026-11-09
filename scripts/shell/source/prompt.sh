#!/bin/sh
# Cross-platform prompt configuration

# Only configure prompt in interactive shells and only for bash
# (zsh uses powerlevel10k configuration)
case $- in
    *i*)
        if [ -n "$BASH_VERSION" ]; then
            # Simple, clean prompt showing current directory
            PS1='\w $ '
        fi
        ;;
esac