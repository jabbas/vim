return {
  -- "ckipp01/nvim-jenkinsfile-linter",
  "midekra/nvim-jenkinsfile-linter",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      pattern = { "*.jenkinsfile" },
      callback = function() require('jenkinsfile_linter').validate() end
    })
  end
}
