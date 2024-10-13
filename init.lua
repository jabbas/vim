require('lazy_plugin')
require('keys')

if (vim.g.neovide) then
  vim.o.guifont = "Monego:h12"
end

-- main-settings
  vim.opt.history=100
  vim.opt.mouse = 'a'        -- use mouse everywhere
  vim.opt.number = true
  vim.opt.numberwidth = 3
  vim.opt.showcmd = true
  vim.opt.incsearch = true
  vim.opt.hlsearch = true

--  vim.opt.foldmethod = 'expr'
--  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- indentation settings
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2    -- tab between words
  vim.opt.shiftwidth = 2     -- tab width
  vim.opt.smarttab = true

  --vim.opt.cindent = true
  vim.opt.smartindent = true
  vim.opt.smartindent = true
  vim.opt.expandtab = true

-- Remove spaces from line ends
vim.cmd('autocmd BufWritePre * :%s/\\s\\+$//e')
