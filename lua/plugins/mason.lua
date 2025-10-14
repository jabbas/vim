return {
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({})
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },

    opts = {
      -- A list of servers to install automatically upon startup.
      -- This is the main purpose of mason-lspconfig.
      automatic_installation = true, -- Auto-install LSPs listed in ensure_installed
      ensure_installed = {
        "ansiblels",
        "ast_grep",
        "bashls",
        "cssls",
        "dockerls",
        "groovyls",
        "helm_ls",
        "html",
        "jsonls",
        "lua_ls",
        "pyright",
        "ts_ls",
        "vimls",
        "yamlls",
      },

      -- Configuration to be passed to lspconfig for the servers that have been installed.
      -- The keys here are the server names (e.g., 'lua_ls'), and the values are the
      -- setup tables (e.g., options for keymaps, capabilities, etc.).
      -- This key is optional.
      handlers = {
        -- Example handler for setting up specific server options (optional)
        ["yamlls"] = function()
          require("lspconfig").yamlls.setup {
            settings = {
              yaml = {
                schemas = {
                  kubernetes = "k8s-*.yaml",
                }
              }
            }
          }
        end,

        ["helm_ls"] = function()
          require("lspconfig").helm_ls.setup {
            settings = {
            },
          }
        end,

      },
    },

  }
}
