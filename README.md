# sema.nvim

Port of the VSCode theme [sema](https://lunacookies.github.io/sema/) by lunacookies for neovim
with some support for LSP and treesitter semantic highlights.

![screenshot](prev.png)

Made with [lush.nvim](https://github.com/rktjmp/lush.nvim) for personal use.
sema is my favorite vsc theme. Support for other nvim plugins will come when I need it.
I might port over the `chroma`, `soft`, and `light` variants at some point, but no guarantees.

## Installation & usage

**Using [lazy.nvim](https://github.com/folke/lazy.nvim):**

```lua
return { 
    {
        'onlytomorrow/sema.nvim', 
        dependencies = { 'rktjmp/lush.nvim', }
    },
}
```
