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

require('lazy').setup(
  {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    { 'NvChad/nvim-colorizer.lua',
      config = function()
        require("colorizer").setup()
      end
    },

    'mattn/emmet-vim',
    'pedrohdz/vim-yaml-folds',
    'tmhedberg/SimpylFold',
    'sheerun/vim-polyglot',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',

    { "mfussenegger/nvim-lint",
      --config = function()
      --  local lint = require('lint')
      --  lint.linters_by_ft = {
      --    sh = {'shellcheck'},
      --    bash = {'shellcheck'},
      --    zsh = {'shellcheck'},
      --    yaml = {'yamllint'},
      --  }
      --  vim.api.nvim_create_autocmd({"BufWritePost"}, { callback = function() require('lint').try_lint() end })
      --end
    },

    { "williamboman/mason.nvim",
      config = function(_, opts)
        require('mason').setup(opts)
      end
    },

    { "williamboman/mason-lspconfig.nvim",
      --config = function()
      --  local masonlspconfig = require('mason-lspconfig')
      --  masonlspconfig.setup({
      --    ensure_installed = {
      --      "bashls",
      --      "dockerls",
      --      "groovyls",
      --      "helm_ls",
      --      "jsonls",
      --      "lua_ls",
      --      "yamlls",
      --    },
      --    automatic_installation = true,
      --  })
      --  masonlspconfig.setup_handlers {
      --    function(lsp_name)
      --      require('lspconfig')[lsp_name].setup {}
      --    end
      --  }
      --end
    },

    { "neovim/nvim-lspconfig",
      --config = function()
      --  local lsp = require 'lspconfig'
      --  lsp.lua_ls.setup {
      --    settings = { Lua = { diagnostics = { globals = {'vim'} } } }
      --  }

      --  lsp.helm_ls.setup {
      --    settings = {
      --      ['helm-ls'] = {
      --        logLevel = 'info',
      --        yamlls = {
      --          enabled = true,
      --          completion = true,
      --          hover = true,
      --        }
      --      }
      --    }
      --  }
      --end
    },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
      config = function()
        require 'nvim-treesitter.configs'.setup {
          ensure_installed = {
            'c', 'cpp', 'python', 'java', 'kotlin', 'javascript', 'go', 'ruby', 'lua',
            'dockerfile', 'json', 'yaml', 'go', 'groovy', 'csv', 'ini', 'vim', 'html', 'xml',
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
        vim.treesitter.language.register('groovy', 'Jenkinsfile')
      end

    },

    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require 'lualine'.setup {
          options = {
            theme = 'auto',
            icons_enabled = true,
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = { {'filename', path=1 } },
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { {'filename', path=1 } },
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
          },
        }
      end
    },

    { 'nvim-telescope/telescope.nvim',
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

    -- { 'github/copilot.vim', build = ":Copilot auth" },

    { 'ms-jpq/coq_nvim', branch = 'coq' , build = ":COQdeps",
      dependencies = {
        { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
        { 'ms-jpq/coq.thirdparty', branch = '3p', lazy = false },
      },

      config = function()
        vim.g.coq_settings = {
          auto_start = 'shut-up',
        }
      end
    },

    { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' },
      config = function()
        vim.o.foldcolumn = '1'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
        vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)

        require('ufo').setup()
     end
    },

    { 'rmagatti/auto-session',
      config = function()
        require('auto-session').setup()
      end
    },

    { 'rmagatti/alternate-toggler',
      config = function()
        require('alternate-toggler').setup {
          alternates = {
            ["=="] = "!="
          }
        }

        vim.keymap.set(
          "n",
          "<leader><space>",
          "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>"
        )
      end,
      event = { "BufReadPost" },
    },


  --  'neoclide/coc.vim',

  --  { 'iamcco/markdown.preview.nvim',
  --    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --    ft = { "markdown" },
  --    build = function() vim.fn["mkdp#util#install"]() end,
  --  },
  }
)

