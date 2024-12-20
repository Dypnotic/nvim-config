local map = vim.api.nvim_set_keymap

map('n', '<leader>n', '<cmd>bnext<CR>', {noremap = true})
map('n', '<leader>p', '<cmd>bprev<CR>', {noremap = true})
map('n', '<leader>b', '<cmd>buffers<CR>', {noremap = true})
map('n', '<leader>t', '<cmd>tabnew<CR>', {noremap = true})
map('n', '<leader>T', '<cmd>tabclose<CR>', {noremap = true})
map('n', '<leader>Q', '<cmd>qa<CR>', {noremap = true})
map('n', '<leader>q', '<cmd>bd<CR>', {noremap = true})
map('n', '<leader>w', '<cmd>w<CR>', {noremap = true})


map('', '<C-v>', '+p<CR>', { noremap = true, silent = true})
map('!', '<C-v>', '<C-R>+', { noremap = true, silent = true})
map('t', '<C-v>', '<C-R>+', { noremap = true, silent = true})
map('v', '<C-v>', '<C-R>+', { noremap = true, silent = true})
