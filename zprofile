#!/bin/zsh
# Common term settings
LANG=en_US.UTF-8
LC_ALL=$LANG

# Path (https://github.com/antonio/zsh-config/blob/master/help/typeset)
export PYENV_ROOT="$HOME/.pyenv"
typeset -gxaU path
path+=(
    /opt/homebrew/bin/
    $HOME/bin
    $HOME/.local/bin
    $HOME/.local/share/bin
    $HOME/.cargo/bin
    $HOME/.poetry/bin
    $HOME/.config/yarn/global/node_modules/.bin
    $HOME/.gem/ruby/2.7.0/bin
    $PYENV_ROOT/bin
)
if [[ $OSTYPE =~ darwin.* ]]; then
    path+=(
        /usr/local/Cellar/fontforge/20201107/bin
        /opt/homebrew/bin
    )
fi

# Manpath
typeset -gxaU manpath
manpath+=()

# C++
export CXX=clang++

# Rust
if [ -z rustc ]; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# Neovim
export nvimp="$HOME/.config/nvim/lua/plugins.lua"

# Work
export app="$HOME/Documents/work/kgpf/kgpf-stack/kgpf_app"

# Python
# eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init --path)"
