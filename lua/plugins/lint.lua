return {
  "mfussenegger/nvim-lint",
  -- No 'opts' key is used here because we are not calling lint.setup().
  -- We are instead setting properties on the 'lint' module and creating an autocmd.

  config = function()
    local lint = require("lint")

    -- 1. Set the linters_by_ft property
    -- This is equivalent to your original 'lint.linters_by_ft = {...}'
    lint.linters_by_ft = {
      sh = {"shellcheck"},
      bash = {"shellcheck"},
      zsh = {"shellcheck"},
      yaml = {"yamllint"},
    }

    -- 2. Create the autocmd for automatic linting
    vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost"},
      {
        group = vim.api.nvim_create_augroup("LazyLinting", { clear = true }),
        callback = function()
          lint.try_lint()
        end
      }
    )
  end,
}
