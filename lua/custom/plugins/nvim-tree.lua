local function custom_on_attach(bufnr)
  local api = require 'nvim-tree.api'

  -- use opts to make sure mappings are applied to nvim-tree bufnr
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts 'CD')
  vim.keymap.set('n', 'K', api.node.show_info_popup, opts 'Info')

  vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts 'Rename: Omit Filename')
  vim.keymap.set('n', '<C-t>', api.node.open.tab, opts 'Open: New Tab')

  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts 'Close Directory')

  vim.keymap.set('n', '<CR>', api.node.open.edit, opts 'Open')
  vim.keymap.set('n', '<Tab>', api.node.open.preview, opts 'Open Preview')

  vim.keymap.set('n', 'R', api.tree.reload, opts 'Refresh')

  vim.keymap.set('n', '<leader>a', api.fs.create, opts 'Create File Or Directory')
  vim.keymap.set('n', '<leader>c', api.fs.copy.node, opts 'Copy')
  vim.keymap.set('n', '<leader>d', api.fs.remove, opts 'Delete')
  vim.keymap.set('n', '<leader>D', api.fs.trash, opts 'Trash')
  vim.keymap.set('n', '<leader>m', api.marks.toggle, opts 'Toggle Bookmark')
  vim.keymap.set('n', '<leader>p', api.fs.paste, opts 'Paste')
  vim.keymap.set('n', '<leader>q', api.tree.close, opts 'Close')
  vim.keymap.set('n', '<leader>r', api.fs.rename, opts 'Rename')
  vim.keymap.set('n', '<leader>W', api.tree.collapse_all, opts 'Collapse')
  vim.keymap.set('n', '<leader>x', api.fs.cut, opts 'Cut')
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      -- custom nvim-tree buffer stuf
      on_attach = custom_on_attach,

      -- keep cursor on start of line when looking through files
      hijack_cursor = true,

      -- show modified files
      modified = {
        enable = true,
      },

      -- keep nvim-tree consistent across tabs
      tab = {
        sync = {
          open = true,
          close = true,
        },
      },

      -- sync nvim-tree to cwd (:pwd)
      -- useful when switching sessions
      sync_root_with_cwd = true,
    }

    vim.keymap.set('n', '<C-f>', ':NvimTreeFindFile<CR>')
    vim.keymap.set('n', '<C-S-F>', ':NvimTreeToggle<CR>')
  end,
}
