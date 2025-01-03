# Playground Neovim Config

1. [Requirements](#requirements)
2. [Setup](#setup)
   - [Build And Install Neovim From Source](#build-and-install-neovim-from-source)
   - [Install Nerd Fonts For Terminal](#install-nerd-fonts-for-terminal)
   - [Install Neovim Config](#install-neovim-config)
   - [Install Package Dependencies](#install-package-dependencies)
3. [Package](#package)
4. [Keymaps](#keymaps)
5. [Commands](#commands)

## Requirements

1. Neovim >= 0.8

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

### Install Package Dependencies

#### LSP

##### TypeScript

```sh
npm install -g typescript-language-server
```

#### Telescope

Install live grep on Linux.

```sh
sudo apt install ripgrep
```

Install live grep on Mac.

```sh
brew install ripgrep
```

#### CopilotChat

For Linux.

```sh
apt install lynx
apt install python3-tiktoken
```

For Mac.

```sh
brew install lynx
brew install python
pip3 install tiktoken
```

#### Clipboard

For Linux Wayland.

```sh
apt install wl-clipboard
```

For Linux Xorg.

```sh
apt install xclip
```

## Package

Install the package to load automatically when Neovim is launched.

```sh
cd ~/.config/nvim
git submodule add git@github.com:owner/package-name.git pack/github/start/package-name
```

Install the package that only need to be loaded as required.

```sh
cd ~/.config/nvim
git submodule add git@github.com:owner/package-name.git pack/github/opt/package-name
```

## Keymaps

### Copy And Paste

1. `"+y` Copy selection from visual mode to system clipboard
2. `<C-r>+` Paste system clipboard content into input

## Commands

### Files

1. `:find FILENAME` Find file by name in project with `<tab>` auto completion

### Keymaps

1. `:Telescope keymaps` Find keymaps
2. `:help index` All key bindings and commands
3. `:help normal-index` List all key bindings and commands for normal mode
4. `:help visual-index` List all key bindings and commands for visual mode
5. `:help insert-index` List all key bindings and commands for insert mode
