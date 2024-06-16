return {
  'hedyhli/outline.nvim',
  keys = { -- Example mapping to toggle outline
    { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle outline' },
  },
  opts = {
    -- Your setup opts here
    outline_items = {
      show_symbol_lineno = true,
    },
    outline_window = {
      show_cursorline = true,
      hide_cursor = true,
    },
    preview_window = {
      auto_preview = true,
      live = true,
    },

    keymaps = {
      close = { 'q' }, -- <Esc> shold not close outline
      focus_code = { 'Esc' },
    },
  },
}
