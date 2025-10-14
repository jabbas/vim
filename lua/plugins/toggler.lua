return {
  'rmagatti/alternate-toggler',
  -- 1. Use 'opts' for the setup table passed to require('alternate-toggler').setup()
  opts = {
    alternates = {
      ["=="] = "!=",
    }
  },

  -- 2. Use 'init' for the keymap
  -- The init function runs early and defines the keymap.
  init = function()
    vim.keymap.set(
      "n",
      "<leader><space>",
      "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>"
    )
  end,

  -- Keep the event trigger
  event = { "BufReadPost" },
}
