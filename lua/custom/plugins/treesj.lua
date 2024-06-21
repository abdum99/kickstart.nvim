return {
  'Wansmer/treesj',
  keys = { 'gj' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    local tsj = require 'treesj'
    tsj.setup {
      use_default_keymaps = false,
    }
    vim.keymap.set('n', 'gj', tsj.toggle, { desc = '[J]oin Toggle' })
  end,
}
