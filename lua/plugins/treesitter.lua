return {
  "nvim-treesitter/nvim-treesitter",
  -- Trigger the load only when you open a file, improving startup time
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    -- I've removed the duplicate languages from your list to make it cleaner.
    local languages = {
      "awk",
      "bash",
      "c",
      "clojure",
      "cmake",
      "comment",
      "cpp",
      "css",
      "csv",
      "diff",
      "dockerfile",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "gotmpl",
      "gpg",
      "groovy",
      "helm",
      "html",
      "htmldjango",
      "ini",
      "java",
      "javascript",
      "jq",
      "json",
      "kotlin",
      "lua",
      "make",
      "markdown",
      "nginx",
      "ninja",
      "passwd",
      "perl",
      "php",
      "promql",
      "properties",
      "python",
      "readline",
      "regex",
      "rst",
      "ruby",
      "scss",
      "sql",
      "strace",
      "swift",
      "tcl",
      "terraform",
      "tsv",
      "vim",
      "vimdoc",
      "xml",
      "yaml"
    }

    require('nvim-treesitter.configs').setup {
      ensure_installed = languages,
      auto_install = true,  -- Automatically install parsers for new languages
      sync_install = false, -- Install parsers asynchronously

      highlight = {
        enable = true,
        -- Some languages (like TSX) require this to be false
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true
      }
    }

    -- Associate 'Jenkinsfile' with the 'groovy' parser
    vim.treesitter.language.register('groovy', 'Jenkinsfile')
  end,
}
