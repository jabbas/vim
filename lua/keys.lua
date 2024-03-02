-- emmet
vim.g.user_emmet_leader_key = '<c-z>'

-- reselect visual block after reindent
vim.cmd('vnoremap < <gv')
vim.cmd('vnoremap > >gv')

-- split jump - Tab
vim.api.nvim_set_keymap('n', '<Tab>', ':wincmd w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':wincmd W<CR>', { noremap = true })

-- tab jump - Alt-Tab
vim.api.nvim_set_keymap('n', '<A-Tab>', 'gt<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-S-Tab>', 'gT<CR>', { noremap = true })

-- split jump - Alt-<arrows>
vim.api.nvim_set_keymap('n', '<A-Left>',  '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-Down>',  '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-Up>',    '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-Right>', '<C-w>l', { noremap = true })
