return {
  'tiagovla/scope.nvim',
  lazy = false,
  config = function()
    require('scope').setup {
      -- These hooks allow barbar to preserve buffer order
      hooks = {
        pre_tab_leave = function()
          vim.api.nvim_exec_autocmds('User', { pattern = 'ScopeTabLeavePre' })
        end,

        post_tab_enter = function()
          vim.api.nvim_exec_autocmds('User', { pattern = 'ScopeTabEnterPost' })
        end,
      },
    }
  end,
}
