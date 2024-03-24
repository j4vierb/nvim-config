--[[
-- In this file is my personal configutarion to Nvim.
--
-- You can find how to do it by yourself in the next YouTube video
-- https://www.youtube.com/watch?v=zHTeCSVAFNY
--]]


-------------------------
-- Basic configuration
-------------------------

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")
vim.cmd("set number")
vim.cmd("set mouse=a")
vim.cmd("syntax on")

-------------------------
-- Install Lazy
-------------------------

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

-------------------------
-- Define plugins
-------------------------

local plugins = {
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000
  }, {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5", 
    dependencies = { "nvim-lua/plenary.nvim" }
  }, {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  }, {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
}
local opts = {}

require("lazy").setup(plugins, opts)
require("gruvbox").setup();
local builtin = require("telescope.builtin")
--require("catppuccin").setup()

-------------------------
-- Keymap set
-------------------------

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal right<CR>', {})
vim.keymap.set('n', '<C-w>', ':wq<CR>', {})
vim.keymap.set('n', '<C-q>', ':q<CR>', {})
vim.keymap.set('n', '<C-s>', ':w<CR>', {})

-------------------------
-- Config Treesitter
-------------------------

local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {"lua", "java", "javascript", "typescript", "c"},
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})

-------------------------
-- Theme configuration
-------------------------

vim.cmd("colorscheme gruvbox")

