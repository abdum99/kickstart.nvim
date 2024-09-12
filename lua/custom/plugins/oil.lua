return {
  'stevearc/oil.nvim',
  opts = {
    columns = {
      'icon',
      'permissions',
      'size',
      'mtime',
    },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { 'n', '<leader>-', '<Cmd>Oil<CR>', { desc = 'Open Parent Directory' } },
  },
  config = function()
    local oil = require 'oil'

    -- keymaps
    vim.keymap.set('n', '<leader>-', oil.open_float(''), { desc = 'Directory CWD' })
  end,
}
