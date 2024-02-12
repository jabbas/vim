require('plugins')
require('keys')

vim.cmd [[ colorscheme catppuccin-frappe ]]

if vim.g.neovide then
  vim.o.guifont = "Monego:h12"
end

-- main settings
  vim.opt.history=100
  vim.opt.mouse = 'a'        -- use mouse everywhere
  vim.opt.number = true
  vim.opt.numberwidth = 3
  vim.opt.showcmd = true
  vim.opt.incsearch = true
  vim.opt.hlsearch = true

  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- indentation settings
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2    -- tab between words
  vim.opt.shiftwidth = 2     -- tab width
  vim.opt.smarttab = true

  --vim.opt.cindent = true
  vim.opt.smartindent = true
  vim.opt.smartindent = true
  vim.opt.expandtab = true

-- vim-airline
  vim.opt.laststatus = 2
  vim.opt.encoding = "utf-8"
  vim.g.airline_powerline_fonts = 1
  vim.g.airline_theme = 'ubaryd'

-- SimplyFold
  vim.g.SimplyFold_docstring_preview = 1

-- Remove spaces from line ends
  vim.cmd('autocmd BufWritePre * :%s/\\s\\+$//e')

require('lualine').setup {
  options = {
    theme = 'codedark',
    icons_enabled = true
  }
}

-- require('jenkinsfile_linter').validate()
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'c', 'cpp', 'python', 'java', 'kotlin', 'javascript', 'go', 'ruby', 'lua',
    'dockerfile', 'json', 'yaml', 'go', 'csv', 'ini', 'vim', 'html', 'xml',
    'gitcommit', 'gitignore', 'git_rebase', 'gitattributes',
    'bash', 'awk', 'cmake', 'ninja', 'css', 'markdown', 'make', 'diff',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}

require('mason').setup()
