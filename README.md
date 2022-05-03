# epics.nvim

EPICS-related tools for NeoVim

## Requirements

NeoVim >= 0.7

## Usage

Add this plugin your preferred way.

Then, in your Lua configuration, simply do:

```lua
require("epics").setup {
	-- Configuration options go here
}
```

## Configuration options

Values shown here are the default:

```lua
{
	-- Use nvim-treesitter's ensure_install to ensure you have all the required
	-- tree-sitter grammars
	ensure_ts_installed = true,
}
```
