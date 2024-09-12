require 'config.globals'
-- NeoVim Options
require 'config.options'

-- NeoVim Remaps
require 'config.remaps'

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Lazy Plugins
require 'lazy-plugins'

-- Theme
-- vim.o.background = 'dark'
vim.cmd.colorscheme 'sonokai'
vim.g.sonokai_style = 'atlantis'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
