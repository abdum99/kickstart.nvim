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
      auto_preview = false,
      live = false,
      open_hover_on_preview = true,
    },

    keymaps = {
      close = { 'q' }, -- <Esc> shold not close outline
      focus_code = { '<Esc>' },
      hover_symbol = { 'gh' },
    },

    symbols = {
      filter = {
        'Property',
        'Field',
        'Variable',
        'String',
        'Number',
        'Boolean',
        'Array',
        'Object',
        'Key',
        'Null',
        'EnumMember',
        'Parameter',
        exclude = true
      },
    },
  },
}
