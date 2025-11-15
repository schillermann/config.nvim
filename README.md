# My Personal Neovim Config

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
git clone --recurse-submodules git@github.com:schillermann/config.nvim ~/.config/nvim
```

### Update Neovim Config

Update config with packages.

```sh
git pull --recurse-submodules
```

Add new packages.

```sh
git submodule update --init --recursive
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

#### Today

Copy journal template in folder.

```sh
mkdir ~/.today
cp ~/.config/nvim/template-today.md ~/.today/jrnl.md
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

### Window

1. `<C-w>o` Close other windows

### Copy And Paste

1. `"+y` Copy selection from visual mode to system clipboard
2. `<C-r>+` Paste system clipboard content into input

## Commands

### Files

|Command         |Description                                              |
|----------------|---------------------------------------------------------|
|`:find FILENAME`|Find file by name in project with `<tab>` auto completion|

### Help

|Command                      |Description                         |
|-----------------------------|------------------------------------|
|`:Telescope keymaps`         |Find user keymaps                   |
|`:Telescope commands`        |Find user commands                  |
|`:Telescope commands_ex`     |Find Ex commands                    |
|`:Telescope commands_options`|Find command options                |
|`:help index`                |List of all commands for each mode  |
|`:help normal-index`         |List of all commands for normal mode| 
|`:help visual-index`         |List of all commands for visual mode|
|`:help insert-index`         |List of all commands for insert mode|

## Troubleshooting

### Push New Git Branch

When you push a new branch ...

```vim
:Git push
```

... can you get this error.

```sh
fatal: The current branch my-new-branch has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin my-new-branch

To have this happen automatically for branches without a tracking
upstream, see 'push.autoSetupRemote' in 'git help config'.
```

One solution is to set the git remote push setup to automatic.

```sh
git config --global --type bool push.autoSetupRemote true
```

### Help Map for vim-fugitive package

If you type `g?` and get the error, then the help tags are missing.

```sh
no help for fugitive-map
```

This is how you create the help tags.

```vim
:helptags ALL
```
