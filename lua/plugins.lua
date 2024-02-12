local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
  {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    'mattn/emmet-vim',
    'pedrohdz/vim-yaml-folds',
    'tmhedberg/SimpylFold',
    'sheerun/vim-polyglot',
    'nvim-lua/plenary.nvim',
    { "williamboman/mason.nvim" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.5', requires = { "nvim-lua/plenary.nvim" } },
    { 'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } },

  --  'neoclide/coc.vim',

  --  { 'iamcco/markdown.preview.nvim',
  --    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --    ft = { "markdown" },
  --    build = function() vim.fn["mkdp#util#install"]() end,
  --  },
  }
)

