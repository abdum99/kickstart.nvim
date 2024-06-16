vim.keymap.set('v', '<leader>y', '+y')

-- Clear search highlights on <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Buffer Controls
-------------------------
vim.keymap.set({ 'n', 'i', 'v' }, '<C-h>', '<Cmd>BufferPrevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-l>', '<Cmd>BufferNext<CR>', { desc = 'Next Buffer' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-;>', '<Cmd>lua print("TODO: pin tabs")<CR>', { desc = 'Pin Buffer' })
vim.keymap.set({ 'n', 'i', 'v' }, "<C-'>", '<Cmd>BufferClose<CR>', { desc = 'Close Buffer' })

-- <Alt-q> to close buffer
vim.keymap.set('n', '<C-x>', '<Cmd>BufferClose<CR>')

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

-- WINDOW managemenet
--  See `:help wincmd` for a list of all window commands
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-e>', '<C-w><C-l>', { desc = 'Move focus to the left window' })
--  <Ctrl-Shift-[hjkl]>
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-H>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-L>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-J>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S-K>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
