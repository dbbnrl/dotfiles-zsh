# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

PATH="/usr/local/cuda/bin:$PATH"

export GHC_VERSION=7.10.1
# export CABAL_VERSION=1.22
# export PATH="$HOME/bin:$HOME/.cabal/bin:/opt/ghc/$GHC_VERSION/bin:/opt/cabal/$CABAL_VERSION/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

if [ -d "$HOME/.stack/programs/x86_64-linux/ghc-$GHC_VERSION/bin" ] ; then
    PATH="$HOME/.stack/programs/x86_64-linux/ghc-$GHC_VERSION/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
