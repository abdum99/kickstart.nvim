return {
  'olimorris/persisted.nvim',
  lazy = false, -- make sure the plugin is always loaded at startup
  dependencies = {
    'nvim-tree/nvim-tree.lua',
    'hedyhli/outline.nvim',
  },
  config = function()
    require('persisted').setup {
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

    -- before saving a session close nvim-tree to avoid empty nvim-tree (or I think netrw buffer) problem
    vim.opt.sessionoptions:append 'globals'
    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = 'PersistedSavePre',
      group = group,
      callback = function(session)
        vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
        require('outline').close()
        -- require('nvim-tree.api').tree.close_in_all_tabs()
      end,
    })

    -- After loading a session, open nvim-tree by default
    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = 'PersistedLoadPost',
      group = group,
      callback = function(session)
        require('nvim-tree.api').tree.open()
      end,
    })

    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = 'PersistedTelescopeLoadPre',
      group = group,
      callback = function(session)
        -- Save the currently loaded session using a global variable
        require('persisted').save { session = vim.g.persisted_loaded_session }

        -- Delete all of the open buffers
        vim.api.nvim_input '<ESC>:%bd!<CR>'
      end,
    })
  end,
}
