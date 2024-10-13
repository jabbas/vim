return {

  { "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      require("telescope").setup(opts)

      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files in cwd" })
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find files that contains" })
      vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume previous" })
    end
  },

}
