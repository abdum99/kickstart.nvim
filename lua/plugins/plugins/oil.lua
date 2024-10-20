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
  -- keys = {
  --   { 'n', '<leader>-', '<Cmd>Oil<CR>', { desc = 'Open Parent Directory' } },
  -- },
  config = function()
    local oil = require 'oil'

    oil.setup {
      columns = {
        'icon',
        -- 'permissions',
        -- 'size',
        -- 'mtime',
      },

      keymaps = {
        -- Telescope search the current dir
        ['<leader>ff'] = {
          function()
            cwd = require('oil').get_current_dir()
            require('oil').close()
            require('telescope.builtin').find_files {
              cwd = cwd,
            }
          end,
          mode = 'n',
          nowait = true,
          desc = 'Find files in the current directory',
        },
        -- Telescope grep the current dir
        ['<leader>fg'] = {
          function()
            cwd = require('oil').get_current_dir()
            require('oil').close()
            require('telescope.builtin').live_grep {
              cwd = cwd,
            }
          end,
          mode = 'n',
          nowait = true,
          desc = 'Live grep in the current directory',
        },
        ['q'] = 'actions.close',
        -- ['y'] = function ()
        --   vim.fn.fnamemodify(oil.get_cursor_entry().parsed_name, ":p:.")
        -- end,
      },
    }

    -- keymaps
    vim.keymap.set('n', '<leader>_', function ()
      oil.open_float ''
    end, { desc = 'Directory CWD' })
    vim.keymap.set('n', '<leader>-', oil.open_float, { desc = 'Directory CWD' })
  end,
}
