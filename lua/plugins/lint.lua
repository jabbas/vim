return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      sh = {"shellcheck"},
      bash = {"shellcheck"},
      zsh = {"shellcheck"},
      yaml = {"yamllint"},
    }
    vim.api.nvim_create_autocmd({"BufWritePost"},
      { callback = function() require("lint").try_lint() end }
    )
  end

}
