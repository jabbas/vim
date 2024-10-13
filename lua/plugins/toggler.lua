return {

  { 'rmagatti/alternate-toggler',
    config = function()
      require('alternate-toggler').setup {
        alternates = {
          ["=="] = "!="
        }
      }

      vim.keymap.set(
        "n",
        "<leader><space>",
        "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>"
      )
    end,
    event = { "BufReadPost" },
  },

}
