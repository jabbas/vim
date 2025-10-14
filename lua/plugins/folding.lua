return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },

  init = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
  end,
  -- 2. Use 'opts' for the setup table passed to require("ufo").setup()
  -- If you had any options to pass to setup, they would go here.
  -- Since your original config didn't pass any options (opts was an empty table '_'),
  -- you can omit the opts key or define it as an empty table.
  -- Example with a dummy option:
  -- opts = {
  --   provider_selector = function()
  --     return { "treesitter", "indent" }
  --   end,
  -- },

}
