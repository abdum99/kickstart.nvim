vim.keymap.set('v', '<leader>y', '+y')

-- Clear search highlights on <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Buffer Controls
-------------------------
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-P>', '<Cmd>BufferPrevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-N>', '<Cmd>BufferNext<CR>', { desc = 'Next Buffer' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-D>', '<Cmd>BufferPin<CR>', { desc = 'Pin Buffer' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-X>', '<Cmd>BufferClose<CR>', { desc = 'Close Buffer' })
-- <Alt-[hjkl]> to navigate
-- e.g.:
-- ˚ = <Alt-k>
vim.keymap.set('n', '˚', '<Cmd>BufferNext<CR>')
vim.keymap.set('n', '∆', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '˙', '<Cmd>BufferFirst<CR>')
vim.keymap.set('n', '¬', '<Cmd>BufferLast<CR>')

-- <Alt-q> to close buffer
vim.keymap.set('n', 'œ', '<Cmd>BufferClose<CR>')

-- Tab
-- TODO: use telescope here instead
vim.keymap.set('n', '<leader>tt', ':tabnew')
vim.keymap.set('n', '<C-t>', '<C-w>T')

vim.keymap.set('n', '<leader>tn', ':tabnext<CR>')
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>')
vim.keymap.set('n', '<leader>th', ':tabfirst<CR>')
vim.keymap.set('n', '<leader>tl', ':tablast<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', 'ge', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', 'gq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
