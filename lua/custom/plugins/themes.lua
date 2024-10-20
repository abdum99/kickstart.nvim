return {
  -- {
  -- 'projekt0n/github-nvim-theme',
  -- name = 'github-theme',
  -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
  -- priority = 1000, -- make sure to load this before all the other start plugins
  -- config = function()
  --   require('github-theme').setup({
  --     -- ...
  --   })
  --
  --   -- vim.cmd('colorscheme github_dark_dimmed')
  --   vim.cmd('colorscheme github_dark_default')
  -- end,
  -- },
  {
    'Shatur/neovim-ayu',
    lazy = false,
    priority = 1000,
    config = function()
      -- an attempt to merge current hl with future ones
      -- problem is that this loads before other extensions...
      -- best solution is to do this in other extensions instead
      -- e.g. gitsigns, lspconfig, etc
      --
      -- local function get_full_hl_by_name(group)
      --   local gui_hl = vim.api.nvim_get_hl_by_name(group, true)
      --
      --   local cterm = vim.api.nvim_get_hl_by_name(group, false)
      --   local ctermfg, ctermbg = cterm.foreground, cterm.background
      --   cterm.foreground, cterm.background = nil, nil
      --
      --   return vim.tbl_extend('error', gui_hl, {
      --     ctermfg = ctermfg,
      --     ctermbg = ctermbg,
      --     cterm = cterm,
      --   })
      -- end
      --
      -- local function update_hl(group, vals)
      --   local new_vals = vim.tbl_extend('force', vals, get_full_hl_by_name(group))
      --   -- vim.api.nvim_set_hl(0, group, new_vals)
      --   return new_vals
      -- end

      local colors = require 'ayu.colors'
      colors.generate(false) -- false => no mirage variant of theme
      print 'printing whats already there'
      require('ayu').setup {
        mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
        terminal = false, -- Set to `false` to let terminal manage its own colors.
        overrides = { -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
          IncSearch = { bg = colors.special, fg = colors.bg, bold = true, italic = true },
          MatchParen = { bg = colors.accent, fg = colors.bg },
          LineNr = { bg = colors.selection_inactive },
          CursorLineNr = { bg = colors.selection_inactive, fg = colors.accent },
        },
      }
    end,
    init = function()
      vim.cmd.colorscheme 'ayu'
    end,
  },
  -- { -- You can easily change to a different colorscheme.
  --   -- Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is.
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   config = function()
  --     require('tokyonight').setup {
  --       style = "night",
  --     }
  --     require('tokyonight').load()
  --   end
  --   -- init = function()
  --   --   -- Load the colorscheme here.
  --   --   -- Like many other themes, this one has different styles, and you could load
  --   --   -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --   --   -- vim.cmd.colorscheme 'tokyonight-night'
  --   --
  --   --   -- You can configure highlights by doing something like:
  --   --   -- vim.cmd.hi 'Comment gui=none'
  --   -- end,
  -- },
  --
  -- -- Using lazy.nvim
  -- {
  --   'ribru17/bamboo.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('bamboo').setup {
  --       -- optional configuration here
  --     }
  --     require('bamboo').load()
  --   end,
  -- },
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('gruvbox').setup {
  --       -- inverse = false,
  --       -- contrast = 'soft',
  --     }
  --     require'gruvbox'.load()
  --   end,
  -- },
  -- {
  --   'navarasu/onedark.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('onedark').setup {
  --       style = 'dark'
  --     }
  --     require'onedark'.load()
  --   end
  -- },
  -- {
  --   'sainnhe/sonokai',
  --   lazy = false,
  --   priority = 1000,
  -- },
  -- {
  --   'marko-cerovac/material.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('material').setup {
  --     }
  --   end
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('kanagawa').setup {
  --       style = 'dark'
  --     }
  --     require'kanagawa'.load('wave')
  --   end
  -- }
}
