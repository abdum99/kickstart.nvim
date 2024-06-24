return {
  'olimorris/persisted.nvim',
  lazy = false, -- make sure the plugin is always loaded at startup
  dependencies = {
    'nvim-tree/nvim-tree.lua',
    'hedyhli/outline.nvim',
  },
  config = function()
    require('persisted').setup {
      autosave = true,
      autoload = true,
      -- use_git_branch = true,
      -- TODO: use on_autoload_no_session to load use a dashboard (for now prob just do intro)
      ignored_dirs = {
        { '~/', exact = true },
        { '~/Downloads', exact = true },
      },
    }

    local group = vim.api.nvim_create_augroup('PersistedHooks', {
      clear = false,
    })

    vim.opt.sessionoptions = { -- required
      'buffers',
      'tabpages',
      'globals', -- scope and barbar use this
      'curdir' -- save cwd
    }

    -- This allows barbar to store info about order of buffers
    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = 'PersistedSavePre',
      group = group,
      callback = function()
        vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
      end,
    })

  end,
}
