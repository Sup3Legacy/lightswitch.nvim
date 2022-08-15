# Lightswitch.nvim

This is a simple plugin for switch between dark- and lightmode `colorscheme`s.

# Using Lightswitch.nvim

## Prerequesites

Neovim v>=`7.0`

## Install

This can be installed using any package manager for Neovim. 

For example with `packer`:

```lua
use 'Sup3Legacy/lightswitch.nvim'
```

## Configuration

Setup the plugin using

```lua
require('lightswitch').setup(
    {
        -- Required arguments
        light = [[ Your light theme ]],
        dark = [[ Your dark theme ]],

        -- Optional argument with default value
        -- Whether the theme should be set by default to dark
        default = true
    }
)
```

## Commands

`lightswitch.nvim` defines one command: `:LightSwitch`, which switches the theme.

## Indicator

`require('lightswitch').indicator` is a function returning a string representing the currently used theme, for use in e.g. `lualine`.
