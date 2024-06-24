-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

local opt = vim.opt

---------------------
-- Tab / Indentation
---------------------
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

---------------------
-- Search
---------------------
opt.ignorecase = true
-- opt.smartcase = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true
opt.incsearch = true
-- Preview substitutions live, as you type!
opt.inccommand = 'split'

---------------------
-- Appearance
---------------------
opt.number = true
opt.termguicolors = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Show which line your cursor is on
opt.cursorline = true

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

---------------------
-- Behavior
---------------------
-- Do NOT sync clipboard -- I like my vim registers
opt.clipboard = ''

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Save undo history
opt.undofile = true

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Enable break indent
opt.breakindent = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
