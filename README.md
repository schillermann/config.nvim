# My Personal Neovim Config

## Requirements

1. Neovim >= 0.12

## Setup

### Build And Install Neovim From Source

#### Ubuntu

Change to the directory, where you want to copy the source files of Neovim and clone it from repository.

```sh
sudo apt install git
git clone https://github.com/neovim/neovim
```

Install build tools

```sh
sudo apt-get install ninja-build gettext cmake unzip curl g++
```

Build Neovim

```sh
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
```

Install Neovim

```sh
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
```

[Complete Neovim installation manual](https://github.com/neovim/neovim/wiki/Building-Neovim)
