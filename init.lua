require('plugins')
require('keys')

if (vim.g.neovide) then
  vim.o.guifont = "Monego:h12"
end

vim.cmd('colorscheme catppuccin-frappe')

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

-- vim-airline
  vim.opt.laststatus = 2
  vim.opt.encoding = "utf-8"
  vim.g.airline_powerline_fonts = 1
  vim.g.airline_theme = 'ubaryd'

-- SimplyFold
  vim.g.SimplyFold_docstring_preview = 1

-- Remove spaces from line ends
  vim.cmd('autocmd BufWritePre * :%s/\\s\\+$//e')

local lint = require('lint')
lint.linters_by_ft = {
  sh = {'shellcheck'},
  bash = {'shellcheck'},
  zsh = {'shellcheck'},
  yaml = {'yamllint'},
}
vim.api.nvim_create_autocmd({"BufWritePost"}, { callback = function() require('lint').try_lint() end })

local masonlspconfig = require('mason-lspconfig')
masonlspconfig.setup({
  ensure_installed = {
    "bashls",
    "dockerls",
    "groovyls",
    "helm_ls",
    "jsonls",
    "lua_ls",
    "yamlls",
  },
  automatic_installation = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

masonlspconfig.setup_handlers {
  function(lsp_name)
    require('lspconfig')[lsp_name].setup {
      capabilities = capabilities,
    }
  end
}

local lsp = require 'lspconfig'
lsp.lua_ls.setup {
  settings = { Lua = { diagnostics = { globals = {'vim'} } } }
}

lsp.helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      logLevel = 'info',
      yamlls = {
        enabled = true,
        completion = true,
        hover = true,
      }
    }
  }
}


