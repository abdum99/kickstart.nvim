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

local function ignore_tree_on_close()
  -- Make :bd and :q behave as usual when tree is visible
  vim.api.nvim_create_autocmd({ 'BufEnter', 'QuitPre' }, {
    nested = false,
    callback = function(e)
      local tree = require('nvim-tree.api').tree

      -- Nothing to do if tree is not opened
      if not tree.is_visible() then
        return
      end

      -- How many focusable windows do we have? (excluding e.g. incline status window)
      local winCount = 0
      for _, winId in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(winId).focusable then
          winCount = winCount + 1
        end
      end

      -- We want to quit and only one window besides tree is left
      if e.event == 'QuitPre' and winCount == 2 then
        vim.api.nvim_cmd({ cmd = 'qall' }, {})
      end

      -- :bd was probably issued an only tree window is left
      -- Behave as if tree was closed (see `:h :bd`)
      if e.event == 'BufEnter' and winCount == 1 then
        -- Required to avoid "Vim:E444: Cannot close last window"
        vim.defer_fn(function()
          -- close nvim-tree: will go to the last buffer used before closing
          tree.toggle { find_file = true, focus = true }
          -- re-open nivm-tree
          tree.toggle { find_file = true, focus = false }
        end, 10)
      end
    end,
  })
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

    vim.keymap.set('n', '<leader>E', ':NvimTreeFindFile<CR>')
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
    vim.keymap.set('n', '<C-e>', ':NvimTreeFindFile<CR>')
    vim.keymap.set('n', '<C-S-E>', ':NvimTreeToggle<CR>')

    ignore_tree_on_close()
  end,
}
