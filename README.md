# mumux.nvim

Very simple neovim plugin that creates commands like `split` and `vsplit` but instead
of creating neovim windows you get tmux panes.

## Installation

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'DeviousStoat/mumux.nvim'
```

### Using `<insert your plugin manager here>`

You will probably figure it out

## Usage

This plugin creates two commands `Mumux` and `VMumux`.
No keymaps are set.

```viml
:Mumux /path/to/my/file
```

Will open `/path/to/my/file` in a new neovim instance in a horizontal tmux pane

```viml
:VMumux /path/to/my/file
```

Will open `/path/to/my/file` in a new neovim instance in a horizontal tmux pane

You can add a `bang` (`:Mumux!`) to make the new tmux pane a proper shell
eg. if you use `:Mumux` you get a new neovim instance but once you close it
the pane closes with it. The bang prevents that, you get back to the terminal.

## Configuration

Nothing to configure
