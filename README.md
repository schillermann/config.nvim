# Playground Neovim Config

## Requirements
1. Neovim >= 0.8

## Install
### Build Neovim from source
#### Ubuntu
Change to the directory, where you want to copy the source files of neovim and clone it from repository.
```sh
sudo apt install git && git clone https://github.com/neovim/neovim
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

### Neovim config
```sh
git clone https://github.com/schillermann/playground-nvim-config.git ~/.config/nvim
```

### Install nvim-lspconfig using Vim's "packages" feature
```sh
git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig
```

## Keymaps

1. `<C-X>` `<C-O>` auto completion
