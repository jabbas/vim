return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'c', 'cpp', 'python', 'java', 'kotlin', 'javascript', 'go', 'ruby', 'lua',
          'dockerfile', 'json', 'yaml', 'go', 'gotmpl', 'gpg', 'groovy', 'helm', 'csv', 'ini',
          'vim', 'html', 'htmldjango', 'xml', 'lua', 'make', 'nginx', 'perl', 'php', 'promql',
          'regex', 'readline', 'ruby', 'rst', 'scss', 'sql', 'strace', 'swift', 'tcl',
          'terraform', 'tsv', 'vim', 'vimdoc', 'xml',
          'gitcommit', 'gitignore', 'git_rebase', 'git_config', 'gitattributes',
          'bash', 'awk', 'cmake', 'ninja', 'css', 'markdown', 'make', 'diff', 'javascript',
          'clojure', 'gpg', 'ini', 'comment', 'jq', 'passwd', 'properties', 'tsv'
        },
        auto_install = true,
        sync_install = false,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true
        }
      }
      vim.treesitter.language.register('groovy', 'Jenkinsfile')
    end,
}
