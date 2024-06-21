local keymap = vim.keymap

keymap.set('v', '<leader>y', '+y')

-- Clear search highlights on <Esc>
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Buffer Controls
-------------------------
keymap.set('n', '<leader>b', '<Cmd>BufferPick<CR>', { desc = 'Buffer Pick' })

-- Sadly I can't map '<C-[>' bc that's the same sequence as <Esc> "(
keymap.set({ 'n', 'i', 'v' }, '<C-q>', '<Cmd>BufferPrevious<CR>', { desc = 'Previous Buffer' })
keymap.set({ 'n', 'i', 'v' }, '<C-e>', '<Cmd>BufferNext<CR>', { desc = 'Next Buffer' })
keymap.set({ 'n', 'i', 'v' }, '[<leader>', '<Cmd>BufferPrevious<CR>', { desc = 'Previous Buffer' })
keymap.set({ 'n', 'i', 'v' }, ']<leader>', '<Cmd>BufferNext<CR>', { desc = 'Next Buffer' })

keymap.set({ 'n', 'i', 'v' }, '<C-;>', '<Cmd>lua print("TODO: pin tabs")<CR>', { desc = 'Pin Buffer' })
keymap.set({ 'n', 'i', 'v' }, "<C-'>", '<Cmd>BufferClose<CR>', { desc = 'Close Buffer' })

-- <Ctrl-x> to close buffer
keymap.set('n', '<C-x>', '<Cmd>BufferClose<CR>')

-- WINDOW managemenet
-------------------------
--  See `:help wincmd` for a list of all window commands
--  <Ctrl-Shift-[hjkl]>
keymap.set({ 'n', 'i', 'v' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set({ 'n', 'i', 'v' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set({ 'n', 'i', 'v' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set({ 'n', 'i', 'v' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tabs
-------------------------
-- TODO: use telescope here instead
keymap.set('n', '<leader>tt', ':tabnew')
keymap.set('n', '<C-t>', '<C-w>T')

keymap.set('n', '<leader>tn', ':tabnext<CR>')
keymap.set('n', '<leader>tp', ':tabprevious<CR>')
keymap.set('n', '<leader>th', ':tabfirst<CR>')
keymap.set('n', '<leader>tl', ':tablast<CR>')

-- Split
-------------------------
keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit [V]ertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[S]plit [H]orizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = '[S]plit [E]qual size' })
keymap.set('n', '<leader>sx', '<Cmd>close<CR>', { desc = '[S]plit e[X]it' })

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', 'ge', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', 'gq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
