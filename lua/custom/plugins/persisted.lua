return {
  'olimorris/persisted.nvim',
  lazy = false, -- make sure the plugin is always loaded at startup
  config = true,
  opts = {
    autoload = true,
    -- use_git_branch = true,
    -- TODO: use on_autoload_no_session to load use a dashboard (for now prob just do intro)
    ignored_dirs = {
      { '~/', exact = true },
      { '~/Downloads', exact = true },
    },
  },
}
