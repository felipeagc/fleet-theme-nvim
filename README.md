# Fleet theme for Neovim

A port of the default theme from Jetbrains' Fleet IDE for Neovim with Treesitter support.

![Screenshot](https://user-images.githubusercontent.com/17355488/233804511-a079e741-4d25-4232-ac47-da6d160d8f5d.png)

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "felipeagc/fleet-theme-nvim",
  config = function() vim.cmd("colorscheme fleet") end
}
```

## Credits

Colors were initially taken from the [Helix editor](https://github.com/helix-editor/helix)'s builtin [fleet dark theme](https://github.com/helix-editor/helix/blob/b0ceac608ebc117399af89b81fbd0837d370161d/runtime/themes/fleet_dark.toml).

## License
[MIT](./LICENSE)
