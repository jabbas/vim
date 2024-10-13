return {

  { "williamboman/mason.nvim",
    config = function(_, opts)
      require('mason').setup(opts)
    end
  },

  { "williamboman/mason-lspconfig.nvim",
    config = function()
      local masonlspconfig = require('mason-lspconfig')
      masonlspconfig.setup({
        ensure_installed = {
          "ansiblels",
          "ast_grep",
          "bashls",
          "dockerls",
          "groovyls",
          "helm_ls",
          "jsonls",
          "lua_ls",
          "pyright",
          "yamlls",
        },
        automatic_installation = true,
      })
      masonlspconfig.setup_handlers {
        function(lsp_name)

          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
          }

          require('lspconfig')[lsp_name].setup {
            capabilities = capabilities,
          }
        end
      }
    end
  },

  { "neovim/nvim-lspconfig",
    config = function()
      local lsp = require 'lspconfig'

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
    end
  },

}
