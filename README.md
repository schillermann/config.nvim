# Playground Neovim Config

1. [Requirements](#requirements)
2. [Setup](#setup)
   - [Build And Install Neovim From Source](#build-and-install-neovim-from-source)
   - [Install Nerd Fonts For Terminal](#install-nerd-fonts-for-terminal)
   - [Install Neovim Config](#install-neovim-config)
   - [Install LSP Server](#install-lsp-server)
3. [Package](#package)
4. [Keymaps](#keymaps)
5. [Commands](#commands)

## Requirements

1. Neovim >= 0.8

## Setup

### Build And Install Neovim From Source

#### Ubuntu

Change to the directory, where you want to copy the source files of neovim and clone it from repository.

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

### Install Nerd Fonts For Terminal

Pretty popular one is [Hack Fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack).
Download one of the ttf files you want.
Open it and click on install.
Now you have to set the font in the terminal.
Open in the terminal menu preferences and then your profile.
Go to tab text and activate custom font and select your installed font.

### Install Neovim Config

```sh
git clone --recurse-submodules git@github.com:schillermann/playground-nvim-config.git ~/.config/nvim
```

### Install LSP Server

#### TypeScript

```sh
npm install -g typescript-language-server
```

## Package

Install package to load automatically when Neovim is launched.

```sh
git submodule add git@github.com:owner/package-name.git ~/.config/nvim/pack/github/start/package-name
```

Install package that only need to be loaded as required.

```sh
git submodule add git@github.com:owner/package-name.git ~/.config/nvim/pack/github/opt/package-name
```

## Keymaps

1. `<C-X>` `<C-O>` auto completion

## Commands

`:find FILENAME` Find file by name in project with `<tab>` auto completion
