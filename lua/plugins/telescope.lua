return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },

  -- 1. Use 'init' for setting keymaps
  -- This function runs early, before the plugin is loaded.
  init = function()
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files in cwd" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find files that contains" })
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume previous" })
  end,

  -- 2. Use 'opts' for the setup table passed to require('telescope').setup(opts)
  -- Since your original config didn't pass any specific options (opts was an empty table),
  -- you can define an empty table or add your custom Telescope configuration here.
  opts = {
    -- Add your custom telescope configuration options here, e.g.:
    -- defaults = {
    --   layout_strategy = "horizontal",
    --   layout_config = {
    --     prompt_position = "top",
    --   },
    -- },
    -- extensions = {
    --   -- extension options...
    -- },
  },
}
