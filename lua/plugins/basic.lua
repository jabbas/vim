return {
    'mattn/emmet-vim',
    'pedrohdz/vim-yaml-folds',
    'sheerun/vim-polyglot',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    { 'ckipp01/nvim-jenkinsfile-linter', dependencies = { "nvim-lua/plenary.nvim" } },

    { 'NvChad/nvim-colorizer.lua',
      config = function()
        require("colorizer").setup()
      end
    },

}
