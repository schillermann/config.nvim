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

## Plugins

This configuration uses the built-in plugin manager `vim.pack` introduced in Neovim 0.12.

### Install a Plugin

To install a new plugin, add the following line to your `init.lua` (or a file in `plugins/`):

```lua
vim.pack.add({ "https://github.com/user/plugin-name" })
```

### Uninstall a Plugin

To uninstall a plugin, follow these steps:

1. **Remove the plugin from your configuration.** Delete the `vim.pack.add` call for the plugin you want to remove.
2. **Delete the plugin from your disk.** Run the following command in Neovim:

```vim
:lua vim.pack.del({ "plugin-name" })
```

Replace `plugin-name` with the name of the plugin (the last part of its URL, e.g. `telescope.nvim`).

3. **Update the lockfile.** Run `:lua vim.pack.update()` to update the `nvim-pack-lock.json` file.
