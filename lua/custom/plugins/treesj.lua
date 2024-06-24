return {
  'Wansmer/treesj',
  keys = { '<leader>aj' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    local tsj = require 'treesj'
    tsj.setup {
      use_default_keymaps = false,
    }
    vim.keymap.set('n', '<leader>aj', tsj.toggle, { desc = '[A]ction [J]oin Toggle' })
  end,
}
