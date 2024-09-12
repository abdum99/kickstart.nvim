return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    'nvim-tree/nvim-tree.lua',
    'tiagovla/scope.nvim',
    'hedyhli/outline.nvim',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
    --
    sidebar_filetypes = {
      -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
      -- NvimTree = { text = 'File Explorer', align = 'center' },
      Outline = { text = 'Symbols', align = 'center' },
    },

    highlight_visible = false,

    animation = false,

    icons = {
      buffer_index = true,
      -- buffer_number = true,
    }
  },
  -- config = function()
  --   require('scope').setup {
  --     hooks = {
  --       pre_tab_leave = function()
  --         vim.api.nvim_exec_autocmds('User', { pattern = 'ScopeTabLeavePre' })
  --         -- [other statements]
  --       end,
  --
  --       post_tab_enter = function()
  --         vim.api.nvim_exec_autocmds('User', { pattern = 'ScopeTabEnterPost' })
  --         -- [other statements]
  --       end,
  --
  --       -- [other hooks]
  --     },
  --
  --     -- [other options]
  --   }
  -- end,
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
