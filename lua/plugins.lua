local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.coq_settings = {
  auto_start = 'shut-up'
}

require('lazy').setup(
  {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    'mattn/emmet-vim',
    'pedrohdz/vim-yaml-folds',
    'tmhedberg/SimpylFold',
    'sheerun/vim-polyglot',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',

    { "mfussenegger/nvim-lint",
      config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
          sh = {'shellcheck'},
          bash = {'shellcheck'},
          zsh = {'shellcheck'},
          yaml = {'yamllint'},
        }

        vim.api.nvim_create_autocmd({"BufWritePost"}, { callback = function() require('lint').try_lint() end })
      end
    },

    {
      "williamboman/mason.nvim",
      config = function(_, opts)
        require('mason').setup(opts)
      end
    },

    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require('mason-lspconfig').setup({
          ensure_installed = {
            "bashls",
            "clang-format",
            "clangd",
            "dockerls",
            "groovyls",
            "helm_ls",
            "jsonls",
            "lua_ls",
            "neocmake",
            "pyright",
            "shellcheck",
            "typos",
            "yamllint",
            "yamlls",
          },
          automatic_installation = true,
        })
      end
    },

    {
      "neovim/nvim-lspconfig",
      config = function()
        local lsp = require 'lspconfig'
        lsp.lua_ls.setup {
          settings = { Lua = { diagnostics = { globals = {'vim'} } } }
        }

        lsp.dockerls.setup {}
        lsp.pyright.setup {}
        lsp.groovyls.setup {}
        lsp.jsonls.setup {}
        lsp.bashls.setup {}
        lsp.yamlls.setup {}
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
        lsp.neocmake.setup {}
      end
    },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.5',
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function(_, opts)
        require('telescope').setup(opts)

        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files in cwd" })
        vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find files that contains" })
        vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume previous" })
      end
    },

    { 'ckipp01/nvim-jenkinsfile-linter', dependencies = { "nvim-lua/plenary.nvim" } },

    { 'github/copilot.vim', build = ":Copilot auth" },

    {
      'ms-jpq/coq_nvim', branch = 'coq' , build = ":COQdeps",
      dependencies = {
        { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
        { 'ms-jpq/coq.thirdparty', branch = '3p', lazy = false,
          config = function()
            require('coq_3p') {
              { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
            }
          end
        },
      },

      config = function()
        vim.g.coq_settings = {
          auto_start = 'shut-up',
        }
      end
    },

  --  'neoclide/coc.vim',

  --  { 'iamcco/markdown.preview.nvim',
  --    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --    ft = { "markdown" },
  --    build = function() vim.fn["mkdp#util#install"]() end,
  --  },
  }
)

