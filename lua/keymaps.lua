local set = vim.keymap.set
-- [[ Basic Keymaps ]]
--  See `:help set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Defer LSP keymaps until LSP attaches - moved to lsp.lua
-- set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
-- set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Code action' })

set('n', '<leader>n', '<cmd>Navbuddy<CR>', { desc = 'Navigation' })
set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })
set('n', '\\', '<cmd>Ex<CR>', { desc = 'Delete buffer' })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- split windows
set('n', '<leader>\\', ':vsplit<CR>', { desc = 'Split window vertically' })
set('n', '<leader>-', ':split<CR>', { desc = 'Split window horizontally' })

-- TIP: Disable arrow keys in normal mode
set('n', '<left>', '<cmd>echo "Use h to move i_dot!!"<CR>')
set('n', '<right>', '<cmd>echo "Use l to move i_dot!!"<CR>')
set('n', '<up>', '<cmd>echo "Use k to move i_dot!!"<CR>')
set('n', '<down>', '<cmd>echo "Use j to move i_dot!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
--
set('v', '<leader>ul', "<cmd>lua vim.cmd([[silent '<,'>s/^/- /]])<CR>", { desc = 'Unordered list' })

set('v', '<leader>ol', "<cmd>lua vim.cmd([[silent '<,'>g/^/let i=1 | s/^/\\=i.'. ' | let i=i+1]])<CR>", { desc = 'Ordered list' })
